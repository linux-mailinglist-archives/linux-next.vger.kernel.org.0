Return-Path: <linux-next+bounces-8321-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1213B58959
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 02:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEF682A03BC
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 00:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1F71D31B9;
	Tue, 16 Sep 2025 00:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXLQHJY9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1A21A9F82
	for <linux-next@vger.kernel.org>; Tue, 16 Sep 2025 00:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757982503; cv=none; b=iLD+KX8jA4rhTsxLiFiTbtJhAr5gw6cn4c8U5J/vrkGO/w/a+4Is2HuzEEORfMVHyk/BsZx2FbDRGfz1sArNTBEmku8QnerVi2OP1bLFkuxvKvaUNnj4x/8AFLFXhQUaH9yXN+zafzDRfgxAPUBaHB+4z63A1Wh1viyUWd/1zmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757982503; c=relaxed/simple;
	bh=T4FR0ZIhBd2R0gRWCZdVUCIVwfUiBE8hHRGT34VaXww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRpqntWIKkaK7qmuGP2XcLbbSn8QN9JX3HwMwFAw0vrg4xQgAd12p1IhRgGiCybdrVBx64NJv+OqCHLtSOAb9dMgpSxfSgK9Qku4LYBPkxq3wwDdF65D3OMnaEt+Tay2eLTA+tLQ3+yUzjXV3eTMYRkI3/psrs6FT+ZQ3hb7sXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXLQHJY9; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7f04816589bso468603485a.3
        for <linux-next@vger.kernel.org>; Mon, 15 Sep 2025 17:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757982499; x=1758587299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEQQug3AovcM6NC71MR7bT+yceXeTwMixGfHwtQI9ng=;
        b=RXLQHJY97W2tr3wOdD7aRe8469BMittWxIZyeQAxw4XNA0NdxUQjI5Ka7NWwdXLFI6
         axW5oAYocM/5cDFSPzdeIy1p8jiRI0owQFj/5R3GFH7uOeO8hlVhVoT3ZdlqiA2XWQYm
         Kz6hWG7+L38X2QEIZdAPU+sgOJLnwIN+duLJ8jfI+ROg8c5TxuK84eH34AT8Xsx8PNqG
         VfId5C/ob1113O0bOVX0MTESufJxuFcpriV7/+3OazcTX7XagQnULtaBXd5XHwxv4h0D
         BiO37HqdeVzY8WEDoVp3jLY0KDYEPYrVKFm4ZnNYU68B8lgTOk2vTIuHAkWucOqXWTAX
         QjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757982499; x=1758587299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEQQug3AovcM6NC71MR7bT+yceXeTwMixGfHwtQI9ng=;
        b=tqrPyTZzluMnaJ4mq4VpffwXOeU0q8xiVijsp2xdygJIF1MHindr86CR+t8fNta1ti
         h0N7TuuYvP3iSIAu/4Ir8vo/4uG+dur9bFTQ2Kk2GW/32yzqlht66UNqWJ98AKVyhr/k
         vXlPiDxCz4PqewkqBrfNVsjdxGdCKTt4Nu7dqdKYE+d3BK/2cq5D9R7wtDxlFrqjB8hA
         4F5J9fHxNOJZjXXjh9czlKO6za3/Mny0Ni9/HHrOj0zOQqzTVVq8DE3kzjWBY7IsW0eK
         iMC/KkGlD4D00kzrA+qUGMSTALLxQBTrbg+tRUajLihuQo/7wOLXgeIJx6PFd+zKM6AL
         5MZA==
X-Forwarded-Encrypted: i=1; AJvYcCXsgiNVCIWWAbnD8sz3pgalLxkvG+XgF9qjVMrKxt2Nc/gAcsPgDqfNRbQbidjE6xqHnfrJMXpRKhb3@vger.kernel.org
X-Gm-Message-State: AOJu0YwTBKFqnyED+ndGOJvoanhCyC5ltgoh3K3Su50emnCtWn+yGm49
	z/cgEp6uabEzoCoWTIDGP7Hn14aDuN7zaAQ1ie2cgXAtGdnuLaqQR/gc
X-Gm-Gg: ASbGnctozBzxJvoD+bTtUH63lmQ4REDr2sOXYr+oTT9ujvD6nacscI7oDvulJxZf9QV
	SoLxknSPS2SG+/xOTgIxMtU1v+kqxhn/rwKSgWVIPDscOTTQBTvb23EJjPj1ouqX12lJ1CfIEBc
	Dun5HZbM25fK6qOXhWFiP5P/Ey+x6cdHcfodr80QD4haekGHZC+wouZL39i2BmtJwRP/hE/sRqD
	+NBrxXInKJAFTC2LOgKgvpMo/qeVcyORfBktTiAHS9ZpegTlzJ+1HJr4p3wQvcnNoi/1ijEVggW
	nDQ51NlXPmHNKnIlqo23RAmgADpOFGd2JAzWFHwjjAv9E7kK9bX/aMbURGUGQvLdot2KCekQDOY
	fKcGXF2UpJBlpBcWKTRCLMq0YwMPS3Y+mB5d6i6193/Wp4NpMOpZ7+cR1M/NxYghwdgLOJuRrMO
	DldZr1Zi6O5tpfotFZzyVt/6XMK5u013FS5Dvs7cF+s24wuMvpDFLc
X-Google-Smtp-Source: AGHT+IFGrUhDUZRFH7v5XG6LjyJa9V2kfPAslsRYf223c3WwW8aGdWipXFrqhGCYo0wOCCkc3MS2Zg==
X-Received: by 2002:ad4:5fcf:0:b0:78d:e0d:31cf with SMTP id 6a1803df08f44-78d0e0d345dmr22431416d6.50.1757982499152;
        Mon, 15 Sep 2025 17:28:19 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-763bdd36aeasm87765626d6.42.2025.09.15.17.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 17:28:18 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 64034F40066;
	Mon, 15 Sep 2025 20:28:18 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 15 Sep 2025 20:28:18 -0400
X-ME-Sender: <xms:Iq_IaMC6QsefsGGfpWTKv0ug1RC9qmuKeAxOzvSATmBbDImg6nLfxQ>
    <xme:Iq_IaHJHgGtlEMgGIVbD6GPvUqpUEh3DUu6YShPyZmvHIHuJx0h16OtPGTVTdgZxl
    _Ec56Qo3NBw8jjfbA>
X-ME-Received: <xmr:Iq_IaHCqy7Vf_uIbFHuG_Mn3BoAo7xG5vmncRB8gF5TlFJ7GVDf8fpyntTls>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefledufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    uddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgt
    phhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhphgrseiihi
    htohhrrdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegrgigsohgvsehkvghr
    nhgvlhdrughkpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:Iq_IaMtM43E5NGQdNYkGluApCF-KIora_OqZ8x15gPRR-gqWF2IxDw>
    <xmx:Iq_IaFR_G0ehqUp_pjgEJw_qI8Lj3T166ttY7lvkWjDOaUyeLN1r8w>
    <xmx:Iq_IaDLo2_zxZ1UgEhflEQAKY-qZHC0Wg3ukS0r2k0HgZ1T94hgdFA>
    <xmx:Iq_IaIsGBdnK7XZyG_iBjIDWFST3rE5AMGEaGLHceoUEu0o4Zvibbg>
    <xmx:Iq_IaK9Bs8PnmlHNSycOj2QxOki3kg_9xFCxkYOGHvsgKuaxXGfXp9K7>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Sep 2025 20:28:17 -0400 (EDT)
Date: Mon, 15 Sep 2025 20:28:17 -0400
From: Boqun Feng <boqun.feng@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Gary Guo <gary@garyguo.net>, Jens Axboe <axboe@kernel.dk>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the block tree
Message-ID: <aMivId3faSSzy5v8@tardis-2.local>
References: <aMiScHEWoOABPgt9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMiScHEWoOABPgt9@sirena.org.uk>

On Mon, Sep 15, 2025 at 11:25:52PM +0100, Mark Brown wrote:
> Hi all,
> 

Hi Mark,

Thanks for reporting this. Your resolution looks good to me. Thanks!

Jens and Andreas, if you want to test this, please wait until the fix
[1] of tip/locking/core (top commit should be 17d9f8eaa87d "MAINTAINERS:
update atomic infrastructure entry to include Rust") to propagate to
tip/master (and then linux-next), otherwise you will get a compile error
because of missing a patch. Of course feel free to test with a manual
merge of tip/locking/core and block/for-next ;-)

[1]: https://lore.kernel.org/lkml/aMirlpnVNLqvwdCu@tardis-2.local/

Regards,
Boqun

> Today's linux-next merge of the tip tree got a conflict in:
> 
>   rust/kernel/block/mq/operations.rs
> 
> between commit:
> 
>   90d952fac8ac1 ("rust: block: add `GenDisk` private data support")
> 
> from the block tree and commit:
> 
>   b6dd7b75496c5 ("rust: block: convert `block::mq` to use `Refcount`")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc rust/kernel/block/mq/operations.rs
> index d098a8a3e4340,c0f95a9419c4e..0000000000000
> --- a/rust/kernel/block/mq/operations.rs
> +++ b/rust/kernel/block/mq/operations.rs
> @@@ -6,15 -6,15 +6,16 @@@
>   
>   use crate::{
>       bindings,
>  -    block::mq::request::RequestDataWrapper,
>  -    block::mq::Request,
>  +    block::mq::{request::RequestDataWrapper, Request},
>       error::{from_result, Result},
>       prelude::*,
> +     sync::Refcount,
>  -    types::ARef,
>  +    types::{ARef, ForeignOwnable},
>   };
> - use core::{marker::PhantomData, sync::atomic::AtomicU64, sync::atomic::Ordering};
> + use core::marker::PhantomData;
>   
>  +type ForeignBorrowed<'a, T> = <T as ForeignOwnable>::Borrowed<'a>;
>  +
>   /// Implement this trait to interface blk-mq as block devices.
>   ///
>   /// To implement a block device driver, implement this trait as described in the



