Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62AC576E2CF
	for <lists+linux-next@lfdr.de>; Thu,  3 Aug 2023 10:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234493AbjHCITi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Aug 2023 04:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234498AbjHCITJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Aug 2023 04:19:09 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A3B655AF
        for <linux-next@vger.kernel.org>; Thu,  3 Aug 2023 01:14:16 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fe2d218eedso7017985e9.0
        for <linux-next@vger.kernel.org>; Thu, 03 Aug 2023 01:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691050455; x=1691655255;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NqGaWIotnKqKyzVdO4mnhnn37JZzzgHfkaj/9pvpDBI=;
        b=ZOwjQWAn7JHFjvwUzCCaWOHFoV4nYBigZDxL/pA53A8MmqPc98WhkWB8eKdDp1OZKb
         HcoFU2/1PWdxhxf+VIgg2OJV9ovta9q+8rV+34rPjs9nhrkvlLexUxH10+8ZX1gzINTS
         byYzHarpU0kESe4wPMGatxISUIFO32Frcj5qZyW7dRIBfh43sh6FGUBDLmyoTPsta8Mr
         kRlmIaqzy7oAGbektaYUDXMUxVcMwIWzb1ZzLQG24QNflszZ+HfXkK4XRTqw+yFDd5/v
         PgB7ztMdy3NqlvBPEzvM1hqR9n8BBqDU8Hx2Sxfj70ZlMOd5IOZ1pzsyjI+fghEzQYze
         9Gdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691050455; x=1691655255;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqGaWIotnKqKyzVdO4mnhnn37JZzzgHfkaj/9pvpDBI=;
        b=h+x8B/HEVvjtkDu51PWreu7p0QuEVk/pY9HyQqzVH0No2OWhfoiDsQP1G+a1buw1Zm
         9qOXM1bJvy8J8F1m93oyhhGj5KQxVL+Md+JJ00u00i7vcOHb/2EOsdROy935h4L2xqVT
         21ni70pqiMBbjutek6lGsOaSSpoidgg+nz+ngZmknfZlUMeuAN27g2//E28uxPEVhu0P
         5mDzh+pDhGjxa+Wv240PGP+mT+wy7Q2TW86zar8Y2UwrqyD5CU5R0ZwCTYNRQB8ZKqpV
         JuhrrG6wTnSqzHRDaq/2nIEFlz6AMOW62PcSZI40bpcZIIuTHr2yq9+j+nkxAKsaZC3V
         Kb4Q==
X-Gm-Message-State: ABy/qLZMEGJCPhBOiuMJtsyowUsynIXHWZLv4Pyu3CJsXo1DSwf/XuxQ
        XMHYJsiLrulD6+RGxfdQvCj7dg==
X-Google-Smtp-Source: APBJJlHG7TGw7P8HEiLdxgaTyrTJbdQEUF5FJHRQOuTIptudXZcmxU7cKeKFDJfovphAgYX5+VJ/wA==
X-Received: by 2002:a05:600c:2a54:b0:3fa:934c:8350 with SMTP id x20-20020a05600c2a5400b003fa934c8350mr6677648wme.27.1691050454645;
        Thu, 03 Aug 2023 01:14:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8656:583:d034:d966? ([2a01:e0a:982:cbb0:8656:583:d034:d966])
        by smtp.gmail.com with ESMTPSA id u3-20020a7bcb03000000b003fbb06af219sm3567818wmj.32.2023.08.03.01.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 01:14:14 -0700 (PDT)
Message-ID: <7e8202d9-3207-bb22-d69d-b2c80eca2a02@linaro.org>
Date:   Thu, 3 Aug 2023 10:14:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] drm/panel: Fix todo indentation for panel
 prepared/enabled cleanup
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>,
        dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230802074727.1.I4036706ad5e7f45e80d41b777164258e52079cd8@changeid>
 <20230802074727.2.Iaeb7b0f7951aee6b8c090364bbc87b1ae198a857@changeid>
Organization: Linaro Developer Services
In-Reply-To: <20230802074727.2.Iaeb7b0f7951aee6b8c090364bbc87b1ae198a857@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 02/08/2023 16:47, Douglas Anderson wrote:
> In commit d2aacaf07395 ("drm/panel: Check for already prepared/enabled
> in drm_panel") the formatting for a code block was not quite
> right. This caused an error when building htmldocs:
> 
>    Documentation/gpu/todo.rst:469: ERROR: Unexpected indentation.
> 
> Fix the error by using the proper syntax for a code block.
> 
> Fixes: d2aacaf07395 ("drm/panel: Check for already prepared/enabled in drm_panel")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/r/20230802141724.0edce253@canb.auug.org.au
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>   Documentation/gpu/todo.rst | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index aa0052f9b93b..139980487ccf 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -465,7 +465,8 @@ Clean up checks for already prepared/enabled in panels
>   
>   In a whole pile of panel drivers, we have code to make the
>   prepare/unprepare/enable/disable callbacks behave as no-ops if they've already
> -been called. To get some idea of the duplicated code, try:
> +been called. To get some idea of the duplicated code, try::
> +
>     git grep 'if.*>prepared' -- drivers/gpu/drm/panel
>     git grep 'if.*>enabled' -- drivers/gpu/drm/panel
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
