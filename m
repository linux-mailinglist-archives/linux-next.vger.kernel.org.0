Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2666443ADF4
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 10:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234064AbhJZI3w (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 04:29:52 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:39818 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbhJZI3t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 04:29:49 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 69CBB1FCA3;
        Tue, 26 Oct 2021 08:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1635236845; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P7u0wBqRsH3OQDCxU4GIDfdl7I5NNgO6MqICOkElv98=;
        b=dMbf3JbCiptnB8cuG4J+1f3A+QL4rTpQ91enq9bXEkndFjjXU8DwUxmD5AU/1cRM8zs0uf
        +tLNuTCuSTRYWo08y34jfNrZ/LZuOCvs/j4hMmIH8JdsoaSIRCLJJ+iQkNRArwBml046Sy
        P/6GS8vgQOcDHcCtLu7uvMeF2SDkAR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1635236845;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P7u0wBqRsH3OQDCxU4GIDfdl7I5NNgO6MqICOkElv98=;
        b=Xa/h5+HGRvIwTVm6PWy75lgF7Ew+5799LqgTKV1eb9a4zzFkUiVe9i4VikhoeKRHjjmTA1
        McuXM/8DlgXJ1ICg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5194B13AEE;
        Tue, 26 Oct 2021 08:27:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id fBXlE+27d2FHVgAAMHmgww
        (envelope-from <bp@suse.de>); Tue, 26 Oct 2021 08:27:25 +0000
Date:   Tue, 26 Oct 2021 10:27:26 +0200
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Wei Liu <wei.liu@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Tianyu Lan <Tianyu.Lan@microsoft.com>,
        Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: linux-next: manual merge of the hyperv tree with the tip tree
Message-ID: <YXe77nC1uNKiuPch@zn.tnic>
References: <20211026172251.0f655709@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211026172251.0f655709@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 26, 2021 at 05:22:51PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the hyperv tree got a conflict in:
> 
>   arch/x86/mm/pat/set_memory.c
> 
> between commit:
> 
>   e9d1d2bb75b2 ("treewide: Replace the use of mem_encrypt_active() with cc_platform_has()")
> 
> from the tip tree and commit:
> 
>   cf90c4532b92 ("x86/hyperv: Add new hvcall guest address host visibility support")
> 
> from the hyperv tree.
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
> diff --cc arch/x86/mm/pat/set_memory.c
> index 527957586f3c,525f682ab150..000000000000
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@@ -2024,6 -2025,17 +2026,17 @@@ static int __set_memory_enc_pgtable(uns
>   	return ret;
>   }
>   
> + static int __set_memory_enc_dec(unsigned long addr, int numpages, bool enc)
> + {
> + 	if (hv_is_isolation_supported())
> + 		return hv_set_mem_host_visibility(addr, numpages, !enc);
> + 
>  -	if (mem_encrypt_active())
> ++	if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
> + 		return __set_memory_enc_pgtable(addr, numpages, enc);
> + 
> + 	return 0;
> + }
> + 
>   int set_memory_encrypted(unsigned long addr, int numpages)
>   {
>   	return __set_memory_enc_dec(addr, numpages, true);

Looks good, thanks.

Wei, you could mention this conflict when sending to Linus or you can
simply merge into your branch the tip branch tip:x86/cc which has the
cc_platform_has() changes and then redo the isolation VM stuff ontop.

HTH.

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
