Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00A023D70A1
	for <lists+linux-next@lfdr.de>; Tue, 27 Jul 2021 09:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235883AbhG0Hya (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Jul 2021 03:54:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35732 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235888AbhG0Hy3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Jul 2021 03:54:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627372468;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=msI4RjMytbP1n7F7yoVvayHHN7FThjzPJmiZOR0CDww=;
        b=HiioyW9V6mNgQmyq04TOLuK6VP7ciAjFusqxRaOJwMO7a4AzEev1cVj7scPOA74AS07e6z
        OJVCJj30tt1bB99HOsPBUgVtvvCF7YW8a41E9P/llhxeFIS4t3kuow2iq7NfvUZpLPOMYo
        GqKIfzcSe5Az0lYScURYQY3aSNFlHxI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-GCREi3HLPBaajEGBVc9tDA-1; Tue, 27 Jul 2021 03:54:27 -0400
X-MC-Unique: GCREi3HLPBaajEGBVc9tDA-1
Received: by mail-wm1-f71.google.com with SMTP id d72-20020a1c1d4b0000b029025164ff3ebfso381042wmd.7
        for <linux-next@vger.kernel.org>; Tue, 27 Jul 2021 00:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=msI4RjMytbP1n7F7yoVvayHHN7FThjzPJmiZOR0CDww=;
        b=NFK7s/uAPWMjJCF7+dcrm/9pqNFpoBar3kd6MaL7FZhIcf2oflrbJEgItyCQNnssCk
         /vF2uMh1a5W0AaHKi4uU0naePOHZ9sXBdi+vFsdZrBO4I06prikrXJQ4jX5WxTVCr3or
         ijkGrqDOLb9o1mLD78uwEye0JUrlsz54gJ2BSfWPQ+T8TVNrFMtNgN73x7ABeilDbOtB
         V7ZUF8Kcfp0nyQzNA14a/zA+1zfA9/V/gc6mporhrKoyipk7u0o0GUS6RDRFckEqf/l3
         8xshs232on8vjWyLAbEtZ2e7G38vBO7xUYsR6D0bgzH8hCL7WswrrrFcfmVlnCEX5TXj
         270g==
X-Gm-Message-State: AOAM531iNdDGbNLM56Irj1bxXN0i7GdxwrXRc9I8MYKTOj6nug2/RJqG
        gV9WVSQA+6X7uAJhkKsvY10dvdvEpUJQtrsuWeD+rgEUMXzqerL6n4B5kgwuOdWt4X3cP+yBEOv
        kgrCJGfTQdBOSVlQJEq2IG+B+peDm2qlinuN6NE66CH/Vm6kPpnNvzfdpRxPqvuU8VRO/sYnp
X-Received: by 2002:a1c:cc05:: with SMTP id h5mr2750561wmb.5.1627372466078;
        Tue, 27 Jul 2021 00:54:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxs3kNtwhKpPWdmwpsLv1on90CJ6AInc7UOF2HuXnQYNpNtZo7URlKNGEOuIDGFM2r1G3RPMg==
X-Received: by 2002:a1c:cc05:: with SMTP id h5mr2750536wmb.5.1627372465738;
        Tue, 27 Jul 2021 00:54:25 -0700 (PDT)
Received: from [192.168.1.101] ([92.176.231.106])
        by smtp.gmail.com with ESMTPSA id p22sm1716714wmq.44.2021.07.27.00.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 00:54:25 -0700 (PDT)
Subject: Re: [PATCH] efi: sysfb_efi: fix build when EFI is not set
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Ard Biesheuvel <ardb@kernel.org>, linux-efi@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org
References: <20210727050447.7339-1-rdunlap@infradead.org>
From:   Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <9aa81fd9-359d-fc30-2969-50b8c7677f9f@redhat.com>
Date:   Tue, 27 Jul 2021 09:54:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727050447.7339-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/27/21 7:04 AM, Randy Dunlap wrote:
> When # CONFIG_EFI is not set, there are 2 definitions of
> sysfb_apply_efi_quirks(). The stub from sysfb.h should be used
> and the __init function from sysfb_efi.c should not be used.
> 
> ../drivers/firmware/efi/sysfb_efi.c:337:13: error: redefinition of ‘sysfb_apply_efi_quirks’
>  __init void sysfb_apply_efi_quirks(struct platform_device *pd)
>              ^~~~~~~~~~~~~~~~~~~~~~
> In file included from ../drivers/firmware/efi/sysfb_efi.c:26:0:
> ../include/linux/sysfb.h:65:20: note: previous definition of ‘sysfb_apply_efi_quirks’ was here
>  static inline void sysfb_apply_efi_quirks(struct platform_device *pd)
>                     ^~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: linux-efi@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-next@vger.kernel.org
> ---
>  drivers/firmware/efi/sysfb_efi.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> --- linext-20210726.orig/drivers/firmware/efi/sysfb_efi.c
> +++ linext-20210726/drivers/firmware/efi/sysfb_efi.c
> @@ -332,6 +332,7 @@ static const struct fwnode_operations ef
>  	.add_links = efifb_add_links,
>  };
>  
> +#ifdef CONFIG_EFI
>  static struct fwnode_handle efifb_fwnode;
>  
>  __init void sysfb_apply_efi_quirks(struct platform_device *pd)
> @@ -354,3 +355,4 @@ __init void sysfb_apply_efi_quirks(struc
>  		pd->dev.fwnode = &efifb_fwnode;
>  	}
>  }
> +#endif
> 

Thanks for the patch.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

