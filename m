Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBF12804DE
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 19:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732670AbgJAROc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 13:14:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732274AbgJAROG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Oct 2020 13:14:06 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA8A3C0613D0;
        Thu,  1 Oct 2020 10:14:06 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id f18so5149078pfa.10;
        Thu, 01 Oct 2020 10:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1IL0AlnNAwGIIncld+2WCsR98xyZUOV2L4BT6NyJFlo=;
        b=UnA2RxDMwGdpuHGBs9xZ6N9lZPMKouQbQWQWEmqRudCGC3GywogNs9vDoTis3SeIdy
         XOboGDqiQguXKf4+1aXHFqwVdtLgNegkfZDSoDcJXineVTWJIZ20GkDNwrnH8ohGHffj
         8wdwGpTZaKKOVUufboWjEkOZPbuHB9ZhfW/f8jhk9EhWOH+f75Cgrs69nVr/xrMErvcF
         +ZWPV4zC/brFUpbe+Q62GGZ/fNpGkoroYuwvqdKFPvUmk5GQ92sVTW+ayjZwk1kl5iDl
         4tj3eW61CkqomEsTbWvikjt/y69kprTqAnfXO3jUEAtyqwFWRm83hYUzXDtHv6/fYi4L
         D/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1IL0AlnNAwGIIncld+2WCsR98xyZUOV2L4BT6NyJFlo=;
        b=rBPzQhErLiE5BcW3BEXYojqUTXYjd0VfEecDNtmOvo/akbL7PHlyiyaTTkmvWwzAID
         kKaCf3rqs9vtzDJuN9THLymYxDsilbkjUimDVup8u6FAVjcwwmxQQhWGFEvAqiMrO8S+
         Z4gGJBzsmbR8BQbaOfRQYRsthYz5HtLdIYg6xCGTI9maqCND0ria62vfqBiVyHGXqFw8
         8imZXa9PMeMf0vnwYbHPRmDo4qV0GD0CFfFeRazU4jxcp++Oc/64xmrptkHEr+X/Pym0
         l25G073ypxpo/YbsUj9IeDnCS3YoJw0IDv69OuFLAyVhUk1PO3bQOAyb3LoUFjbJXMhx
         Fm4g==
X-Gm-Message-State: AOAM5317XyFkl/L4r/oNKJQ6FNGuflq4/eJtMkSL0LH9vKEnAwKOPLs3
        qK3wwpr0pMfKWTgXBsUip+kR5h7spOU=
X-Google-Smtp-Source: ABdhPJxQf72yYe8SCEVQXghCl9gHO7Qygl8oZQhfy/Le4B0N8byPU7NQPd40PXOL9gwoTDj1nJPhPw==
X-Received: by 2002:a63:e:: with SMTP id 14mr2510335pga.426.1601572446100;
        Thu, 01 Oct 2020 10:14:06 -0700 (PDT)
Received: from ubuntu-m3-large-x86 ([2604:1380:45e1:2200::1])
        by smtp.gmail.com with ESMTPSA id k28sm7187761pfh.196.2020.10.01.10.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 10:14:05 -0700 (PDT)
Date:   Thu, 1 Oct 2020 10:14:04 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the pm
 tree
Message-ID: <20201001171404.GB2468854@ubuntu-m3-large-x86>
References: <20201001195353.7e3551f7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001195353.7e3551f7@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 01, 2020 at 07:53:53PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   include/acpi/acpi_numa.h
> 
> between commit:
> 
>   4849bc777049 ("ACPI / NUMA: Add stub function for pxm_to_node()")
> 
> from the pm tree and commit:
> 
>   623347c1b949 ("x86/numa: cleanup configuration dependent command-line options")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc include/acpi/acpi_numa.h
> index 09eb3bc20ff5,0e9302285f14..000000000000
> --- a/include/acpi/acpi_numa.h
> +++ b/include/acpi/acpi_numa.h
> @@@ -23,9 -23,16 +23,20 @@@ extern void bad_srat(void)
>   extern int srat_disabled(void);
>   
>   #else				/* CONFIG_ACPI_NUMA */
>  +static inline int pxm_to_node(int pxm)
>  +{
>  +	return 0;
>  +}
> + static inline void disable_srat(void)
> + {
> + }
>   #endif				/* CONFIG_ACPI_NUMA */
> + 
> + #ifdef CONFIG_ACPI_HMAT
> + extern void disable_hmat(void);
> + #else				/* CONFIG_ACPI_HMAT */
> + static inline void disable_hmat(void)
> + {
> + }
> + #endif				/* CONFIG_ACPI_HMAT */
>   #endif				/* __ACP_NUMA_H */

Thanks Stephen, this was expected. The resolution looks good to me and
is what I had locally.

Cheers,
Nathan
