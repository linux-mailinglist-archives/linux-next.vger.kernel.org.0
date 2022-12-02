Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C63F6408CA
	for <lists+linux-next@lfdr.de>; Fri,  2 Dec 2022 15:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233593AbiLBOzS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Dec 2022 09:55:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233338AbiLBOzN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Dec 2022 09:55:13 -0500
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5FED2DB9
        for <linux-next@vger.kernel.org>; Fri,  2 Dec 2022 06:55:13 -0800 (PST)
Received: by mail-vs1-xe2d.google.com with SMTP id 124so4854378vsv.4
        for <linux-next@vger.kernel.org>; Fri, 02 Dec 2022 06:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WSR/jOiIMc+WctNrPMvJ0YJJViycQTM52rkCmF02xVw=;
        b=06pSc1H0ciV1jAKJgXgmctqZVhQowD04Spo8gawSoFMBwoLdRr3+xVVUaYH3wISuR5
         Doe0jESL71O27cfK+YwkSDsnrBSWSeQTiDM3l5B2630UN1HA5EnvFgfjd/av5yrL1TYq
         2/XxYbOfOY6ilvzlnpXxnHYHhyJG7xlMc4yqrei3IyeOEAEAnycmGh0tid5S0pmoNxhc
         cYY4SjkhUODQXMZlkhZI9lXlRkM8Tewf1BI5VQq5aSKfYyQGWuK2g+pPk0ZAFcKm3Puf
         7NtwLI593ggU6RWmc+Kf8RRfdeUTf52oEJqjxurYTnp6rlUR0ljBdtsnZW6VYNlkSQJA
         897g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WSR/jOiIMc+WctNrPMvJ0YJJViycQTM52rkCmF02xVw=;
        b=EuYZwm/d6GGkahC79ab4iavF5zN9I18j+7BmjWQyqoL7w6WDo7lHtFtVeRvXW6WRd3
         qyvG4qTZBmVV5Ng+lpzuKlzgW2vbitbtSVIs1wRwoJDloPi/dIt4A1uRf3c9bOXnyPlj
         DQAVTKx6GEFBnz1h+67n34LzukYrfHhR2JT+YRHbfGdK2e0sAJ4WtVVfYwWWj92d77Cr
         zWTdg5oBaF1aEptDsocny2kHA9EhpLM9eJk7PfHBT+qLLNnr1NFZRHzsUrLg2kmZXUZN
         7k53kIbrFE5FCJFR2kK0xR2BbbhsSPKlPnSvRlnq9Hd5LL+XENjwmRC1uPIb1F/e80Qx
         +nYA==
X-Gm-Message-State: ANoB5pnc45/GPWw5lfZmdARcqp/BxjDMU5Lb81vI1jH9mBYaeTPqIOyT
        DYoQitzWa9tv2BHciNWj3tLB11ZORsJl5bsn9LqOJA==
X-Google-Smtp-Source: AA0mqf6hX/zO75nXkwbRfAu1OudLsJJaNd/2GRkokM3wcSqtTjCy7u8UtweBseFTqOZp5mORdlbnxK8jtFTPUlUbyzI=
X-Received: by 2002:a67:1c85:0:b0:3b0:92e2:37b0 with SMTP id
 c127-20020a671c85000000b003b092e237b0mr16656024vsc.9.1669992911616; Fri, 02
 Dec 2022 06:55:11 -0800 (PST)
MIME-Version: 1.0
References: <20221202140454.273333-1-vincent@systemli.org>
In-Reply-To: <20221202140454.273333-1-vincent@systemli.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 2 Dec 2022 15:55:00 +0100
Message-ID: <CAMRc=MdZbV+BE1TD1HXRL7XGgKn-+zcdCiGpXWyA=LYWzd4sfg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix compiling when CONFIG_GPIO_CDEV_V1 is not defined
To:     Nick Hainke <vincent@systemli.org>
Cc:     linux-next@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Dec 2, 2022 at 3:06 PM Nick Hainke <vincent@systemli.org> wrote:
>
> If CONFIG_GPIO_CDEV_V1 is not defined compiling will fail with:
>
> drivers/gpio/gpiolib-cdev.c: In function 'linereq_ioctl':
> drivers/gpio/gpiolib-cdev.c:1468:16: error: implicit declaration of
>  function 'call_ioctl_locked' [-Werror=implicit-function-declaration]
>  1468 |         return call_ioctl_locked(file, cmd, arg, lr->gdev,
>       |                ^~~~~~~~~~~~~~~~~
> drivers/gpio/gpiolib-cdev.c: In function 'linereq_poll':
> drivers/gpio/gpiolib-cdev.c:1503:16: error: implicit declaration of
>  function 'call_poll_locked'; did you mean 'wake_up_all_locked'?
>  [-Werror=implicit-function-declaration]
>  1503 |         return call_poll_locked(file, wait, lr->gdev,
>                                       linereq_poll_unlocked);
>       |                ^~~~~~~~~~~~~~~~
>       |                wake_up_all_locked
> drivers/gpio/gpiolib-cdev.c: In function 'linereq_read':
> drivers/gpio/gpiolib-cdev.c:1566:16: error: implicit declaration of
>  function 'call_read_locked'; did you mean 'xa_head_locked'?
>  [-Werror=implicit-function-declaration]
>  1566 |         return call_read_locked(file, buf, count, f_ps, lr->gdev,
>       |                ^~~~~~~~~~~~~~~~
>       |                xa_head_locked
>
> Move "call_poll_locked", "call_ioctl_locked", "call_read_locked" and
> the necessary typedefs "poll_fn", "ioctl_fn", "read_fn" in front of the
> ifdef-statement checking CONFIG_GPIO_CDEV_V1.
>
> Fixes: 98d8b93c6171 ("gpiolib: protect the GPIO device against being dropped while in use by user-space")
>
> Signed-off-by: Nick Hainke <vincent@systemli.org>
> ---
>  drivers/gpio/gpiolib-cdev.c | 50 ++++++++++++++++++-------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index e8079c1d2e1b..067e26a00775 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -61,31 +61,6 @@ static_assert(IS_ALIGNED(sizeof(struct gpio_v2_line_values), 8));
>   * GPIO line handle management
>   */

This comment refers to the below code so should be moved too. Don't
worry about it, I'll resend my series with that included.

Bartosz

>
> -#ifdef CONFIG_GPIO_CDEV_V1
> -/**
> - * struct linehandle_state - contains the state of a userspace handle
> - * @gdev: the GPIO device the handle pertains to
> - * @label: consumer label used to tag descriptors
> - * @descs: the GPIO descriptors held by this handle
> - * @num_descs: the number of descriptors held in the descs array
> - */
> -struct linehandle_state {
> -       struct gpio_device *gdev;
> -       const char *label;
> -       struct gpio_desc *descs[GPIOHANDLES_MAX];
> -       u32 num_descs;
> -};
> -
> -#define GPIOHANDLE_REQUEST_VALID_FLAGS \
> -       (GPIOHANDLE_REQUEST_INPUT | \
> -       GPIOHANDLE_REQUEST_OUTPUT | \
> -       GPIOHANDLE_REQUEST_ACTIVE_LOW | \
> -       GPIOHANDLE_REQUEST_BIAS_PULL_UP | \
> -       GPIOHANDLE_REQUEST_BIAS_PULL_DOWN | \
> -       GPIOHANDLE_REQUEST_BIAS_DISABLE | \
> -       GPIOHANDLE_REQUEST_OPEN_DRAIN | \
> -       GPIOHANDLE_REQUEST_OPEN_SOURCE)
> -
>  typedef __poll_t (*poll_fn)(struct file *, struct poll_table_struct *);
>  typedef long (*ioctl_fn)(struct file *, unsigned int, unsigned long);
>  typedef ssize_t (*read_fn)(struct file *, char __user *,
> @@ -133,6 +108,31 @@ static ssize_t call_read_locked(struct file *file, char __user *buf,
>         return ret;
>  }
>
> +#ifdef CONFIG_GPIO_CDEV_V1
> +/**
> + * struct linehandle_state - contains the state of a userspace handle
> + * @gdev: the GPIO device the handle pertains to
> + * @label: consumer label used to tag descriptors
> + * @descs: the GPIO descriptors held by this handle
> + * @num_descs: the number of descriptors held in the descs array
> + */
> +struct linehandle_state {
> +       struct gpio_device *gdev;
> +       const char *label;
> +       struct gpio_desc *descs[GPIOHANDLES_MAX];
> +       u32 num_descs;
> +};
> +
> +#define GPIOHANDLE_REQUEST_VALID_FLAGS \
> +       (GPIOHANDLE_REQUEST_INPUT | \
> +       GPIOHANDLE_REQUEST_OUTPUT | \
> +       GPIOHANDLE_REQUEST_ACTIVE_LOW | \
> +       GPIOHANDLE_REQUEST_BIAS_PULL_UP | \
> +       GPIOHANDLE_REQUEST_BIAS_PULL_DOWN | \
> +       GPIOHANDLE_REQUEST_BIAS_DISABLE | \
> +       GPIOHANDLE_REQUEST_OPEN_DRAIN | \
> +       GPIOHANDLE_REQUEST_OPEN_SOURCE)
> +
>  static int linehandle_validate_flags(u32 flags)
>  {
>         /* Return an error if an unknown flag is set */
> --
> 2.38.1
>
