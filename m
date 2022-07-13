Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F08465736C3
	for <lists+linux-next@lfdr.de>; Wed, 13 Jul 2022 15:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbiGMNBK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Jul 2022 09:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234985AbiGMNBJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Jul 2022 09:01:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2A96CB6A
        for <linux-next@vger.kernel.org>; Wed, 13 Jul 2022 06:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657717267;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=c5tTaTQWdtIl7l1GJF3+E3vkHxBuOg16Ki+fSt3hNw8=;
        b=bcmcmnPF0rK2cH2cokmatFLEn7go4LfHZfmhlUe+c/cYrTCsqBlAt4k4cYSv8crlaEYEu1
        scnDmunvWGlD2+fVQWKUVA578bpzx6DNgAltd674irs683GYVgSGqxapTbMRBRmz+hvYFd
        AgmLZEeCAiNDaLLsg0WZgrUSQSdTT20=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-OOESekixM66KpD3uKiwWrA-1; Wed, 13 Jul 2022 09:01:05 -0400
X-MC-Unique: OOESekixM66KpD3uKiwWrA-1
Received: by mail-ej1-f72.google.com with SMTP id qk18-20020a1709077f9200b0072b95d9eea3so767060ejc.4
        for <linux-next@vger.kernel.org>; Wed, 13 Jul 2022 06:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c5tTaTQWdtIl7l1GJF3+E3vkHxBuOg16Ki+fSt3hNw8=;
        b=LymFTALYbLufpKAGUQhbn9hZ0sc3VbD091RT1GfKRK3o0Gsc3ZT2Z4PEwfcGAkXMhf
         UoDi+pC5Q/wv73isEsWZQ2mtjEKNQ+qJW+Qdom3vC4OVLn7JnP61y/xsNXGzq7XlLMR3
         u3QIVJySnMcEBfZ4XoK+zxcikEEgKDNvpkDVq8VDcg0zVJfi44GYiFWamhB8IkhXl78X
         NDK7JP5bvupoPTTfw+nlxZ6VIrnZjKbKhw+7R+LH7WyzKzTaBBnAu4Pf9Qd30EsmynsV
         DbUXono9Ti5Y1OMSWenN0R376a+zNqGfoU8nmDKfLPykf5ucSUXw2vv4Kt3MMAEtcc+x
         UlIQ==
X-Gm-Message-State: AJIora+Lfo1yE1dB6ymxoYzfKk9AFXyP9DS494sPoyOFL7fILYLpZ0KQ
        KktnpgF7KcFswKtPXZreZVZZcWlQa+AhlW82ue5g93mMBnq1mwZkfpwNV8V/Y5e3b3UnCYV+RrS
        YAC5E6OUh7+rJq2XlX/aDPRqlfv7h+UnkYy+FmA==
X-Received: by 2002:a17:907:168f:b0:72b:5571:2228 with SMTP id hc15-20020a170907168f00b0072b55712228mr3497007ejc.397.1657717264481;
        Wed, 13 Jul 2022 06:01:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sM/Q/qXIJtvyge1RBA27I1zfyOERWxp2hTuT6He8VnUbVBaCHWeBofNJRY+F3CAMZEc4y1/wzNTDwJ7jxzCyM=
X-Received: by 2002:a17:907:168f:b0:72b:5571:2228 with SMTP id
 hc15-20020a170907168f00b0072b55712228mr3496979ejc.397.1657717264233; Wed, 13
 Jul 2022 06:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220713085627.175604-1-bagasdotme@gmail.com> <20220713085627.175604-2-bagasdotme@gmail.com>
In-Reply-To: <20220713085627.175604-2-bagasdotme@gmail.com>
From:   Vlad Dronov <vdronov@redhat.com>
Date:   Wed, 13 Jul 2022 15:00:53 +0200
Message-ID: <CAMusb+S+JPJOzHYfuK+YvZydNxoQ9nvE_jGoudTPJiD2HfsTNw@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 1/2] Documentation: qat: Use code block for qat
 sysfs example
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     linux-doc@vger.kernel.org, linux-next@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
        Wojciech Ziemba <wojciech.ziemba@intel.com>,
        Adam Guerin <adam.guerin@intel.com>,
        Fiona Trahe <fiona.trahe@intel.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Tomasz Kowallik <tomaszx.kowalik@intel.com>,
        linux-crypto@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Wed, Jul 13, 2022 at 10:57 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> kernel test robot and Stephen Rothwell reported htmldocs warning:
>
> Documentation/ABI/testing/sysfs-driver-qat:24: WARNING: Unexpected indentation.
>
> The warning isn't caused by Date: field pointed by the warning, but rather
> by sysfs example that isn't in literal code block.
>
> Add the code block marker.
>
> Link: https://lore.kernel.org/linux-next/20220711204932.333379b4@canb.auug.org.au/
> Link: https://lore.kernel.org/linux-doc/202207090803.TEGI95qw-lkp@intel.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: d4cfb144f60551 ("crypto: qat - expose device config through sysfs for 4xxx")
> Acked-by: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
> Cc: Wojciech Ziemba <wojciech.ziemba@intel.com>
> Cc: Adam Guerin <adam.guerin@intel.com>
> Cc: Fiona Trahe <fiona.trahe@intel.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: Vladis Dronov <vdronov@redhat.com>
> Cc: Tomasz Kowallik <tomaszx.kowalik@intel.com>
> Cc: linux-crypto@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/ABI/testing/sysfs-driver-qat | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-qat b/Documentation/ABI/testing/sysfs-driver-qat
> index a600531e95628f..43e081ec22cc4a 100644
> --- a/Documentation/ABI/testing/sysfs-driver-qat
> +++ b/Documentation/ABI/testing/sysfs-driver-qat
> @@ -46,7 +46,8 @@ Description:  Reports the current configuration of the QAT device and allows
>
>                 The following example shows how to change the configuration of
>                 a device configured for running crypto services in order to
> -               run data compression:
> +               run data compression::
> +
>                         # cat /sys/bus/pci/devices/<BDF>/qat/state
>                         up
>                         # cat /sys/bus/pci/devices/<BDF>/qat/cfg_services
> --

Acked-by: Vladis Dronov <vdronov@redhat.com>

Best regards,
Vladis Dronov | Red Hat, Inc. | The Core Kernel | Senior Software Engineer

