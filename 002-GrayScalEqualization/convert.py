import cv2
import sys
import os

def convert_to_grayscale(input_path):
    # Read the image in grayscale mode
    img = cv2.imread(input_path, cv2.IMREAD_GRAYSCALE)
    
    if img is None:
        print(f"Error: Could not read image from {input_path}")
        return False
    
    # Split filename and extension
    filename, ext = os.path.splitext(input_path)
    
    # Create output filename with -GS suffix
    output_path = f"{filename}-GS{ext}"
    
    # Save the grayscale image
    success = cv2.imwrite(output_path, img)
    
    if success:
        print(f"Grayscale image saved to: {output_path}")
        return True
    else:
        print(f"Error: Failed to save image to {output_path}")
        return False

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python grayscale_converter.py <image_path>")
        sys.exit(1)
    
    input_path = sys.argv[1]
    convert_to_grayscale(input_path)