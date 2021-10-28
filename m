Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5A643DF11
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 12:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhJ1KmX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 06:42:23 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:40499 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhJ1KmW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 06:42:22 -0400
Received: by mail-wr1-f52.google.com with SMTP id e4so9308428wrc.7;
        Thu, 28 Oct 2021 03:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jhjE6uggRXwcLBz6rtpVFtSWpSJGJ9KkPR5seEmlDps=;
        b=fT+ZCh5csaROFP8W8HnEaglIk3MACPzJWi6e1o39Cq9ISd8YdF1R5GcGIGThej+Wsb
         c4G1eHnjNlUYKpgCkJIyXoYi10tjdO6ElBKNruOmp9CaihpzUW/2ddNwa2sfecZ8980S
         Ov/lwqLkZNfbir8AW4/EoaKjMVkYoQ2EKrBTzrUDC87I0FULRUPuatXobsE7uTsQXH2+
         Hfh8U7SdF9fRJOrqRqv/MvEG67JHkWIug4IgbajsG5TejjpiDp7HzGj9y0sTu18DgLvw
         ZvqLMu/vBxfdzeW4zAQAaYNgze+v3vQnFovv7Z6jffwycOtbFlUQezPHBBVlWCncHDvw
         3CeA==
X-Gm-Message-State: AOAM531zTPDLu9brXBLuq3Zf2exMT3HNYAzaCmFjcFV4IAU1AiNruHsn
        GEUiC7TPO5fhYwB4oKoyqJzXWuxuuxE=
X-Google-Smtp-Source: ABdhPJyAVE/5fkyVJ3vnSOaf3E6NCT/M2KYsF4aVgpeS6QvEVkIzsGoRcy4LIzEB/PA1ERH1kM+PIA==
X-Received: by 2002:adf:f44e:: with SMTP id f14mr3095256wrp.37.1635417595030;
        Thu, 28 Oct 2021 03:39:55 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id c16sm2679409wrm.46.2021.10.28.03.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 03:39:54 -0700 (PDT)
Date:   Thu, 28 Oct 2021 10:39:52 +0000
From:   Wei Liu <wei.liu@kernel.org>
To:     Borislav Petkov <bp@suse.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Wei Liu <wei.liu@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Tianyu Lan <Tianyu.Lan@microsoft.com>,
        Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: linux-next: manual merge of the hyperv tree with the tip tree
Message-ID: <20211028103952.olmn4xqnfwnjrdfc@liuwe-devbox-debian-v2>
References: <20211026172251.0f655709@canb.auug.org.au>
 <YXe77nC1uNKiuPch@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YXe77nC1uNKiuPch@zn.tnic>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 26, 2021 at 10:27:26AM +0200, Borislav Petkov wrote:
> On Tue, Oct 26, 2021 at 05:22:51PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the hyperv tree got a conflict in:
> > 
> >   arch/x86/mm/pat/set_memory.c
> > 
> > between commit:
> > 
> >   e9d1d2bb75b2 ("treewide: Replace the use of mem_encrypt_active() with cc_platform_has()")
> > 
> > from the tip tree and commit:
> > 
> >   cf90c4532b92 ("x86/hyperv: Add new hvcall guest address host visibility support")
> > 
> > from the hyperv tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> > 
> > diff --cc arch/x86/mm/pat/set_memory.c
> > index 527957586f3c,525f682ab150..000000000000
> > --- a/arch/x86/mm/pat/set_memory.c
> > +++ b/arch/x86/mm/pat/set_memory.c
> > @@@ -2024,6 -2025,17 +2026,17 @@@ static int __set_memory_enc_pgtable(uns
> >   	return ret;
> >   }
> >   
> > + static int __set_memory_enc_dec(unsigned long addr, int numpages, bool enc)
> > + {
> > + 	if (hv_is_isolation_supported())
> > + 		return hv_set_mem_host_visibility(addr, numpages, !enc);
> > + 
> >  -	if (mem_encrypt_active())
> > ++	if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
> > + 		return __set_memory_enc_pgtable(addr, numpages, enc);
> > + 
> > + 	return 0;
> > + }
> > + 
> >   int set_memory_encrypted(unsigned long addr, int numpages)
> >   {
> >   	return __set_memory_enc_dec(addr, numpages, true);
> 
> Looks good, thanks.
> 
> Wei, you could mention this conflict when sending to Linus or you can
> simply merge into your branch the tip branch tip:x86/cc which has the
> cc_platform_has() changes and then redo the isolation VM stuff ontop.
> 

Boris and Stephen, thanks for the heads-up.

Wei.

> HTH.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
