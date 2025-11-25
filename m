Return-Path: <linux-next+bounces-9211-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 867ACC8579F
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 15:44:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CC66E4E4264
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 14:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1053232573D;
	Tue, 25 Nov 2025 14:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9faQfzV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7007D142E83
	for <linux-next@vger.kernel.org>; Tue, 25 Nov 2025 14:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764081871; cv=none; b=QyJLsZCW4UaO3J6W89ZVVPD7yl75t2laGZvg6cUZEYN0aace2Ckhxzr2jN2AdbamZd+nGPA1nJLZze9fswNUQ90EFVTIdu7IqQJJ8MxvjUeVO+lC+hjxJd8AiEAoUWlj/rEuINOmc+aJdL9D3o6vb2PvHk0SpNMFCF4e2TyPALQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764081871; c=relaxed/simple;
	bh=r+TNMcYlMkLLTP6CaOv2NNUVNvmBMYKCZ4ytqY38i98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4URZ1jBOZOSZgeiUCYpVPamr04QgmK+wqBOfr6cAhkNEYEEU/0ie5b9+2jGNypjo3cQgVUIWCp7uGwHix9CLL96+xcD4cU3iGXcENfpPMsFTbrQ6iAQYKFKDtw/GBCMJVpNeN7RLAj/bHdWWn1vgxTEeDx7y8wJ0Ve8ZPaZHcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9faQfzV; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-63bc1aeb427so4594185d50.3
        for <linux-next@vger.kernel.org>; Tue, 25 Nov 2025 06:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764081868; x=1764686668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/lXgRsgVtSFg2c/2pQrv1tUNjNdHV64ow7tBycon1o=;
        b=A9faQfzVW6s+VlQV3dk79EFzD/DUUHqEfIFnVoDJ6wamFv5fxsvjsC1GgSF5YaCIif
         TXQrxK6DNB8hlv+AnL2vSJt3HZdAvvlfaUVxx/mEJTSCrcUyuwqiDtk/P7SQ0pW8meCI
         M8xnPmFuU8DygfqdqdZ0Bvcto3PSQKy6LGJbRe//uZ7ntQ61gHl9bJAc7io3UDq62o9f
         vbojSTbGKdVyotRo8q8SvnWRV/T6EU34VSAY1ht2SeFL0Ln7D9PtbrhcD6xyd1wpTT69
         C6K/aFuIpXuq8wzGa96urRaw/2XB7RCScJkak1RkBQkKAJOTVj11wNoBQcFz6DUr7ZSH
         Hipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764081868; x=1764686668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/lXgRsgVtSFg2c/2pQrv1tUNjNdHV64ow7tBycon1o=;
        b=iwKCyCr5ULrVRfWgvoSRgvSsQ4Q4xx8/I1aj5N9DMNOC2C5lFvQMyzWu/MnfdjlWz3
         QWqg8FKa9WvHJDgiWt8/7tnTl2yu/Yj80BYbza7tycQ2M5hdd3BnzGAyim8G9pQbyc6P
         5wb2VcKXuLyrXfqL4IP11CZFk+CUUWAeNEt/bFH75OhKdn2GPXSXqJ2GdbVV/owCwEB/
         slHtnmn1bK9Ia/C8zColcMlAfoVriHC3+RcQNzMEsvSOow2G2iL87OQ8k1Sz6susHjh+
         E+JCSYFkndig1q/JcdgpTcXRPCsv9d4fqsg3VZdpJpY5XUCeK9RQV5IzNpchT1rPemcB
         f9wg==
X-Forwarded-Encrypted: i=1; AJvYcCV518LRcNoBKoh8vQ/WCF3CpGNTHdWBySlCcn5IXCBoak7R3blgM9Un4Oe4phVCuDjYn+U5yJ+JWFsg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7+pQB8XFAhS4GVOp1pXBPCNkiVur3acJMXLxGBPbOn7puWFKE
	Mshv06H3Ky13XzyXCI+f55tSW3ilXJFUJb1Ec99TEfkq1KbuBd2C7QU9
X-Gm-Gg: ASbGnctBRANwxzAmDaYbMFJVtD4luuDeGtfdUXUipuY6pObtwmoSmVeG69BXcZlmAcE
	AHWAZvWEKBCv8hoCv7tfZCPvVTC4T14J1XAeE0Zx6atdp1XuT6u2tLP4z8E5tcaX30qojC6kR60
	bX0xk3fJ0v2iF7M9F7Sg66qffSbXNQ4n7ANbMU/nQpXG75Av1jJALIeeJyLkBlwFPXbhuKLxauI
	u1IBjnLwTJG1lHcz6c4Y11YkthG/+LEsZgNiwx8Go3H8YLB4+kDLDqGfjgZZ/87iL1HTuXrSyiZ
	r80EvfuAQzrHF7bDmRtCdrLIX4mVttpnBeQqRtzLRE+Vyk8kLO31C9Ge+95PGcLmHm7jnsPWWxN
	b4kdOBcm+2eqZjjNtvQgCcfNk5TUhtN+YGOKPoqEMEn8g63audHmSYMA0fDMHT/MJ0HiOidOdeJ
	R82LDx4yo=
X-Google-Smtp-Source: AGHT+IFzCHFVx4aQfl6WiaFFP0uOeyeX2N0kKCvgbb7UvesyntK7T6W9xyHlYHAGzKs/NTjNUhM5ug==
X-Received: by 2002:a05:690e:1510:b0:63f:948b:fef6 with SMTP id 956f58d0204a3-64302ab1e8dmr9446001d50.43.1764081868381;
        Tue, 25 Nov 2025 06:44:28 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:fadf:b739:b8b0:209c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-642f7178824sm6162490d50.15.2025.11.25.06.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 06:44:28 -0800 (PST)
Date: Tue, 25 Nov 2025 09:44:27 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the bitmap tree
Message-ID: <aSXAy6UL19WVjRtk@yury>
References: <20251125182442.49ddb53a@canb.auug.org.au>
 <CAMuHMdWpiTwp=mH8uj71NqzWctWUQymT3BqwSRTCO7xOa3bbWQ@mail.gmail.com>
 <87ldjuy0ln.fsf@bootlin.com>
 <CAMuHMdWDa0Fxxg=O2MiC2oM=unn9679g=JtPBQEOpZx4Y9nKgg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWDa0Fxxg=O2MiC2oM=unn9679g=JtPBQEOpZx4Y9nKgg@mail.gmail.com>

On Tue, Nov 25, 2025 at 09:37:25AM +0100, Geert Uytterhoeven wrote:
> Hi Miquel,
> 
> On Tue, 25 Nov 2025 at 09:31, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > >>  /* non compile-time field get/prep */
> > >> -#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> > >> -#define field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
> > >> +#define sunxi_field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) - 1))
> > >> +#define sunxi_field_prep(_mask, _val) (((_val) << (ffs(_mask) - 1)) & (_mask))
> > >
> > > See "[PATCH -next v6 11/26] mtd: rawnand: sunxi: #undef
> > > field_{get,prep}() before local definition"[1] and follow-up
> > > "[PATCH -next v6 24/26] mtd: rawnand: sunxi: Convert to common
> > > field_{get,prep}() helpers"[2].
> > > The former unfortunately didn't make it into the nand tree yet...
> > >
> > > [1] https://lore.kernel.org/all/703d7eec56074148daed4ea45b637f8a83f15305.1762435376.git.geert+renesas@glider.be
> > > [2] https://lore.kernel.org/all/e1c879967328d8c1098aaa014845c2f11874d7c7.1762435376.git.geert+renesas@glider.be/
> >
> > It wasn't clear to me when/if I could effectively pull these, nor if
> > they would make it for this release. Were you (or someone else) supposed
> > to carry these on your own? Or, can I just apply these two now?
> 
> The first one you can apply now, to fix the build issue.
> The second one has to wait until the changes to <linux/bitfield.h>
> are in your tree.

Is anything expected on my side? Should I drop the trouble patch, or
just wait, or something else?

