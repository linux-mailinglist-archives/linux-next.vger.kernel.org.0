Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE31F6C9BC0
	for <lists+linux-next@lfdr.de>; Mon, 27 Mar 2023 09:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232254AbjC0HOO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Mar 2023 03:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbjC0HON (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Mar 2023 03:14:13 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C3A344BF
        for <linux-next@vger.kernel.org>; Mon, 27 Mar 2023 00:14:12 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id j7so9229353ybg.4
        for <linux-next@vger.kernel.org>; Mon, 27 Mar 2023 00:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679901251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DADc3+3y25wA+EijOJMVd9N7kcsiCNVkrstmJZ8tqpI=;
        b=Rdl/AQ56SV9DvRObt3MwQLMuMrW0nQfSrGayJl00GO0evqEqVoHc04TiQf+WTri43u
         SITTwkJQK7P6gAqw8irtbYtn7eWUzj1UnmcPEtwuYkYKVEnbvBLcJljsPkqO9fNap2Dq
         zQkn6r9nZ/LvHGYC3s+L/qdn4B8dgZryaSda76cHUX+S9H9msqwpVgDM8qEHhetVln0L
         JVVBtfI/qXN4Kp3V1u6VCmhZJRz8lfX640bkrMLItSuDu5R5LuBP+FII6NdCJwfYmMmn
         WAX0PXdTwQ1z9Sr89qg4FzwPHQmj4eNWS3or1RghMLKNeXUMd/GHcELuOuYisF80LBPk
         1cdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679901251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DADc3+3y25wA+EijOJMVd9N7kcsiCNVkrstmJZ8tqpI=;
        b=PWTR0FAsAs5ecx6zmfifxVGu6eDxC1KzkjsWFxFqirPWqzJHtWXQg9axA5u7fZt9VJ
         mhKQw8pGwxdMCO/xqDLMixt0Y1WbZ6kn9gEFQvy6uQCaWhitoumZdufxtPiF0avFt3kI
         GI21H44sPM75zIg/U6I8OAOB5g9tx25a3GhmYBBmS/j4ql9mStwxH7adiFhot9kTYzxh
         LnUCVMAWgoOqMH5WINO/25oyPTfCIKvejDJhnQUiQgnJq3WypM7yrOhsxOqYI1mdf9+L
         ygBKXVi16AiTvPhX1W7yo0g3Q2NBqAaGIjErAz0h4sixbWz6kv8T3FbVSIwsPJY5xJg6
         7h9w==
X-Gm-Message-State: AAQBX9fj0C9+0EngyMSn5OROg9AkSvOyt7S9itXuAEk/NZ4jWB1UX0PR
        R5t2VW8SzWoq4zC8WXenZ1NH0pN7+jggzxnKCr0O5w==
X-Google-Smtp-Source: AKy350Zgax0q8sTztpH7KMeTMyIX1/Z3llPizGyqcwGyW+FPedrteczeEw3cA/BbZPguCWHqJDq6ek7FroXti6lH5ZY=
X-Received: by 2002:a05:6902:1024:b0:b77:3f5a:8a53 with SMTP id
 x4-20020a056902102400b00b773f5a8a53mr4624349ybt.12.1679901251455; Mon, 27 Mar
 2023 00:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230327112026.409883c2@canb.auug.org.au>
In-Reply-To: <20230327112026.409883c2@canb.auug.org.au>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Mon, 27 Mar 2023 09:14:00 +0200
Message-ID: <CACMJSevvO0B8O0K4HtdTdxsGYGVfyHOug=qSg00SwVU+vw8Xsw@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the gpio-intel tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Werner Sembach <wse@tuxedocomputers.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 27 Mar 2023 at 02:20, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> The following commits are also in the gpio-brgl-fixes tree as a different
> commit (but the same patch):
>
>   782eea0c89f7 ("gpiolib: acpi: Add a ignore wakeup quirk for Clevo NL5xNU")
>
> This is commit
>
>   a21031ccf31b ("gpiolib: acpi: Add a ignore wakeup quirk for Clevo NL5xNU")
>
> in the gpio-brgl-fixes tree.
>
> --
> Cheers,
> Stephen Rothwell

I missed the fact Andy already picked it up. Now backed out of my tree.

Bart
