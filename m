Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC57D4D371C
	for <lists+linux-next@lfdr.de>; Wed,  9 Mar 2022 18:44:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237252AbiCIRFU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Mar 2022 12:05:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238105AbiCIRDr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Mar 2022 12:03:47 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85AA4197B72
        for <linux-next@vger.kernel.org>; Wed,  9 Mar 2022 08:52:08 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id q29so1474348pgn.7
        for <linux-next@vger.kernel.org>; Wed, 09 Mar 2022 08:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6KqZ+Z5UPWBbo9cgdXZ4MdKH+Wlw8hd8QXmAI2N9QRQ=;
        b=J99Vvb0ONIbaADp14yM94aFL0jj0jde417xZ8cBorSpy5rp/y9vz4xQpHermBeV2II
         tm1m/OBpK3Ta/oR22Zr7EAhfs2pi1TIZ2YC7W6x6ivwirbX5U1uRJ5iUQsHXiT2Me7mM
         wrzs6smjAUuMzcRS+JNUsMjtKbWYqhO7HS3cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6KqZ+Z5UPWBbo9cgdXZ4MdKH+Wlw8hd8QXmAI2N9QRQ=;
        b=w9Q4j7E3MQmBTmll3ouwMvujufIBLpBa8PWshvwfdjmumRNWl2fIoIhqTPT8IHChUT
         LNbwQ9PZuvGEhXOQZshpeKlHCUz5hUC+98TGGEim3gI8iLFzTcbja8UitOuJUflygYt4
         cplRqOeTNlfIesL6f6sP1ygnudM5anxRmxm1GWs3LdK9NHzRrHbyqpFNY2+ySBMzZU59
         tdXJUaE6L7+obmGas7dgsIlxxqwkdZxMVY1zzN/XVDvdoxyHbfL8hCt8PPp7sI+t+q7F
         6TjlseC58khIQ/oGsZTiQy/pkDz3Ms5nf6duZMNVxZ0WuAe46IT7RsJm85ary5fcqEF1
         M/BQ==
X-Gm-Message-State: AOAM531G0x6VbBig2ASxNIof08FTeQqgPzgWSf6e7EkGDm7r3RxNqOic
        4n2Qnzc8NijpI3M3h2uffpZnjA==
X-Google-Smtp-Source: ABdhPJwwguQVMuWVSYkg2NtpANow16e+5pJrZ16rzbm25K5HrODyYQryYc61eYOmenMPigAJPVLx/Q==
X-Received: by 2002:a63:515:0:b0:379:460f:7bda with SMTP id 21-20020a630515000000b00379460f7bdamr521879pgf.534.1646844727485;
        Wed, 09 Mar 2022 08:52:07 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g10-20020a056a001a0a00b004f7454e4f63sm3517086pfv.189.2022.03.09.08.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 08:52:07 -0800 (PST)
Date:   Wed, 9 Mar 2022 08:52:06 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Mark Pearson <markpearson@lenovo.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp tree
Message-ID: <202203090847.81E8862@keescook>
References: <20220309211029.0c766cac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309211029.0c766cac@canb.auug.org.au>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 09, 2022 at 09:10:29PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from include/linux/bitops.h:33,
>                  from include/linux/kernel.h:22,
>                  from drivers/platform/x86/thinkpad_acpi.c:37:
> drivers/platform/x86/thinkpad_acpi.c: In function 'tpacpi_dytc_profile_init':
> arch/x86/include/asm/bitops.h:207:22: error: array subscript 'long unsigned int[0]' is partly outside array bounds of 'int[1]' [-Werror=array-bounds]
>   207 |                 (addr[nr >> _BITOPS_LONG_SHIFT])) != 0;
>       |                 ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/platform/x86/thinkpad_acpi.c:10385:18: note: while referencing 'output'
> 10385 |         int err, output;
>       |                  ^~~~~~
> 
> Actually the test_bit() in line 10409.
> 
> Caused by commit
> 
>   e1c21608e3cf ("platform/x86: thinkpad_acpi: Add PSC mode support")
> 
> from the drivers-x86 tree interacting with the enablement of
> -Werror=array-bounds.
> 
> I have reverted that commit for today.

Looking at https://lore.kernel.org/all/20220225182505.7234-1-markpearson@lenovo.com/

The problem is with the cast of "int output" to "unsigned long". Past
fixes have either made the variable unsigned long, or adding a new
variable and removal of casts. e.g. this pseudo-patch:

+	unsigned long bits;

	...
+	bits = output;
-	if (test_bit(DYTC_FC_MMC, (void *)&output)) { /* MMC MODE */
+	if (test_bit(DYTC_FC_MMC, &bits)) { /* MMC MODE */

...

-	} else if (test_bit(DYTC_FC_PSC, (void *)&output)) { /*PSC MODE */
+	} else if (test_bit(DYTC_FC_PSC, &bits)) { /*PSC MODE */



-- 
Kees Cook
