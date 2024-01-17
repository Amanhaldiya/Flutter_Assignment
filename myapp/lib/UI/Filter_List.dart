class AgeFilter 
{
  final int lower;
  final int upper;
  AgeFilter(this.lower, this.upper);
  @override
  bool operator ==(Object other) 
  {
    if (identical(this, other)) return true;
    return other is AgeFilter && other.lower == lower && other.upper == upper;
  }
  @override
  int get hashCode => lower.hashCode ^ upper.hashCode;
}

