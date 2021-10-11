Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA80429865
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 22:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235167AbhJKUuI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 16:50:08 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:60152 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232898AbhJKUuH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2021 16:50:07 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 587BD1FEF6;
        Mon, 11 Oct 2021 20:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1633985286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XDfY+sGF6MernPT4pQ3s5gAqwzGT2NbUHUDA3NwnXjU=;
        b=z+iYgMblTz9adtPhxcTEJ3WH5eDlIyXdVm5X475BqUAWWRXaLHCCiXZp4LOH+Lfaay6lT8
        6tTimtgufFLNxDZ1FRnqlGq9wUvEyvAvt0uOop6P8dhuKOq47qDbX3r6uyUqDOqWidqotQ
        VA9XWpLArv07TCWrRQLdxBlSxGH5mkI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1633985286;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XDfY+sGF6MernPT4pQ3s5gAqwzGT2NbUHUDA3NwnXjU=;
        b=4Ei2HtQtSon7D75J3o8+ICLDKfm3824+knheXVYZ5paQTMZ/MqW7TOaCxfEJ+Y7ro924eI
        fAyKzbOXPKd9+ADA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 40ACC13BD8;
        Mon, 11 Oct 2021 20:48:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id vfZXDwajZGGMWAAAMHmgww
        (envelope-from <bp@suse.de>); Mon, 11 Oct 2021 20:48:06 +0000
Date:   Mon, 11 Oct 2021 22:48:02 +0200
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <YWSjAidxoWPcmE3H@zn.tnic>
References: <20211011132120.7bdb70d9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211011132120.7bdb70d9@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Mon, Oct 11, 2021 at 01:21:20PM +1100, Stephen Rothwell wrote:
> I fixed it up (I just used the version form Linus' tree, but with the
> changed return type - see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, below is Ingo's merge resolution which is identical to yours,
AFAICT.

tip/master and tip/auto-latest are updated so you should be able to
forget your fixup from now on.

:-)

Cheers!

> diff --cc arch/x86/kernel/fpu/signal.c
> index fa17a27390ab,ae51e50f25e8..000000000000
> --- a/arch/x86/kernel/fpu/signal.c
> +++ b/arch/x86/kernel/fpu/signal.c
> @@@ -377,16 -382,10 +382,16 @@@ static bool __fpu_restore_sig(void __us
>   	} else {
>   		if (__copy_from_user(&fpu->state.fxsave, buf_fx,
>   				     sizeof(fpu->state.fxsave)))
> - 			return -EFAULT;
> + 			return false;
>   
>  -		/* Mask out reserved MXCSR bits. */
>  -		fpu->state.fxsave.mxcsr &= mxcsr_feature_mask;
>  +		if (IS_ENABLED(CONFIG_X86_64)) {
>  +			/* Reject invalid MXCSR values. */
>  +			if (fpu->state.fxsave.mxcsr & ~mxcsr_feature_mask)
> - 				return -EINVAL;
> ++				return false;
>  +		} else {
>  +			/* Mask invalid bits out for historical reasons (broken hardware). */
>  +			fpu->state.fxsave.mxcsr &= ~mxcsr_feature_mask;
>  +		}
>   
>   		/* Enforce XFEATURE_MASK_FPSSE when XSAVE is enabled */
>   		if (use_xsave())

commit 3ab37cc4d1e3889ddbb44d62a4741754689f6184 (refs/remotes/tip/x86/fpu)
Merge: 724fc0248d45 d298b03506d3
Author: Ingo Molnar <mingo@kernel.org>
Date:   Mon Oct 11 08:53:07 2021 +0200

    Merge branch 'x86/urgent' into x86/fpu, to resolve conflict
    
    Resolve the conflict between these two commits:
    
       x86/fpu:      1193f408cd51 ("x86/fpu/signal: Change return type of __fpu_restore_sig() to boolean")
       x86/urgent:   d298b03506d3 ("x86/fpu: Restore the masking out of reserved MXCSR bits")
    
     Conflicts:
            arch/x86/kernel/fpu/signal.c
    
    Signed-off-by: Ingo Molnar <mingo@kernel.org>

diff --cc arch/x86/kernel/fpu/signal.c
index 39c7bae97daf,fa17a27390ab..37dbfed29d75
--- a/arch/x86/kernel/fpu/signal.c
+++ b/arch/x86/kernel/fpu/signal.c
@@@ -382,11 -377,16 +382,16 @@@ static bool __fpu_restore_sig(void __us
  	} else {
  		if (__copy_from_user(&fpu->state.fxsave, buf_fx,
  				     sizeof(fpu->state.fxsave)))
 -			return -EFAULT;
 +			return false;
  
- 		/* Reject invalid MXCSR values. */
- 		if (fpu->state.fxsave.mxcsr & ~mxcsr_feature_mask)
- 			return false;
+ 		if (IS_ENABLED(CONFIG_X86_64)) {
+ 			/* Reject invalid MXCSR values. */
+ 			if (fpu->state.fxsave.mxcsr & ~mxcsr_feature_mask)
 -				return -EINVAL;
++				return false;
+ 		} else {
+ 			/* Mask invalid bits out for historical reasons (broken hardware). */
+ 			fpu->state.fxsave.mxcsr &= ~mxcsr_feature_mask;
+ 		}
  
  		/* Enforce XFEATURE_MASK_FPSSE when XSAVE is enabled */
  		if (use_xsave())

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
