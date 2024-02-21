import * as React from "react"
import { ComponentType } from "react"
import { StyleProp, TouchableOpacity, TouchableOpacityProps, View, ViewStyle } from "react-native"
import { SvgProps } from "react-native-svg"

import TrailfundsLogo from "../assets/icons/TrailfundsLogo.svg"

export const iconComponents = {
  trailfundsLogo: <TrailfundsLogo />,
  // home: <HomeIcon />,
  // document: <DocumentIcon />,
  // learn: <LearnIcon />,
  // help: <HelpIcon />,
  // close: <CloseIcon />,
  // information: <InformationIcon />,
  // arrowDown: <ArrowDownIcon />,
  // arrowLeft: <ArrowLeftIcon />,
  // wallet: <WalletIcon />,
  // check: <CheckIcon />,
  // video: <VideoIcon />,
  // edit: <EditIcon />,
  // aarpLogo: <AarpLogo />,
  // techStarsLogo: <TechStarsLogo />,
  // savvlyLogo: <SavvlyLogo />,
  // profile: <ProfileIcon />,
}
export type IconTypes = keyof typeof iconComponents

interface IconProps extends TouchableOpacityProps {
  /**
   * The name of the icon
   */
  icon: IconTypes

  /**
   * An optional tint color for the icon
   */
  color?: string

  /**
   * An optional size for the icon. If not provided, the icon will be sized to the icon's resolution.
   */
  size?: number

  /**
   * Style overrides for the icon image
   */
  style?: SvgProps["style"]

  /**
   * Style overrides for the icon container
   */
  containerStyle?: StyleProp<ViewStyle>

  /**
   * An optional function to be called when the icon is pressed
   */
  onPress?: TouchableOpacityProps["onPress"]
}

/**
 * A component to render a registered icon.
 * It is wrapped in a <TouchableOpacity /> if `onPress` is provided, otherwise a <View />.
 *
 * - [Documentation and Examples](https://github.com/infinitered/ignite/blob/master/docs/Components-Icon.md)
 */

export function Icon(props: IconProps) {
  const {
    icon,
    color,
    size,
    style: $imageStyleOverride,
    className,
    containerStyle: $containerStyleOverride,
    ...WrapperProps
  } = props

  const isPressable = !!WrapperProps.onPress
  const Wrapper: ComponentType<TouchableOpacityProps> = WrapperProps?.onPress ? TouchableOpacity : View
  // eslint-disable-next-line security/detect-object-injection
  const iconComponent = React.cloneElement(iconComponents[icon], {
    width: size,
    height: size,
    style: [{ color }, $imageStyleOverride],
    className,
  })
  return (
    <Wrapper accessibilityRole={isPressable ? "imagebutton" : undefined} {...WrapperProps} style={$containerStyleOverride}>
      {iconComponent}
    </Wrapper>
  )
}
