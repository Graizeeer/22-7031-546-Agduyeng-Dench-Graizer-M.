@echo off
setlocal enabledelayedexpansion

REM Prompt user to select a shape
echo Select a shape: circle, triangle, or quadrilateral.
set /p shape="Enter your choice: "

if /i "%shape%"=="circle" (
    set /p radius="Enter the radius: "
    set /a area=31416*%radius%*%radius%/10000
    echo The area of the circle is: %area%
) else if /i "%shape%"=="triangle" (
    set /p a="Enter the length of the first side: "
    set /p b="Enter the length of the second side: "
    set /p c="Enter the length of the third side: "
    set /a s=(%a%+%b%+%c%)/2
    set /a area=s*(s-%a%)*(s-%b%)*(s-%c%)
    set /a area=sqrt(!area!)
    echo The area of the triangle is: %area%

    if %a%==%b% if %b%==%c% (
        echo The triangle is equilateral.
    ) else if %a%==%b% if not %b%==%c% (
        echo The triangle is isosceles.
    ) else if %a%==%c% if not %b%==%a% (
        echo The triangle is isosceles.
    ) else if %b%==%c% if not %a%==%b% (
        echo The triangle is isosceles.
    ) else (
        echo The triangle is scalene.
    )
) else if /i "%shape%"=="quadrilateral" (
    set /p length="Enter the length: "
    set /p width="Enter the width: "
    set /a area=%length%*%width%
    echo The area of the quadrilateral is: %area%

    if %length%==%width% (
        echo The quadrilateral is a square.
    ) else (
        echo The quadrilateral is a rectangle.
    )
) else (
    echo Invalid shape selected.
)

pause
