Return-Path: <linux-next+bounces-9059-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F881C66471
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 22:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 75460360576
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 21:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF492281357;
	Mon, 17 Nov 2025 21:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDTe/s4M"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0422B27FB32
	for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 21:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763415289; cv=none; b=gjrYl+25vctxm31iftX2NAm4bQ7jiCT+XpxprgWzvdH+aoqbpzPsGD/8y8WN9Scm1emy4DmE52TqvDfdoeyiWqZIpa8EOc9a9hk04YlBOYYmM0rhEY9BErBZ8RhM04lJ4e1fRS6jl7pcOSohrwyAgJST0Y/6m3A+gk5VG01RPMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763415289; c=relaxed/simple;
	bh=8frZ29pQdygHLKVHQSqfYr9ibQZgqY0m/janBIhxcQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bo76fRbJHsddmzlJsUWoZjml/20Zc/wG2W2ZMbmeq0mWdyRbV2ohendjLwIllHR+atEK1c0rabg2oZwm2DyTkMGODXFJKZvMPm8Q2YLbNQoHqciRt1hrwVknzeeS6yKk26nXrZftx62hkiLUxEilh7wVjWWyBw/Ok4kCbcQuYFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDTe/s4M; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b28f983333so497928185a.3
        for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 13:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763415287; x=1764020087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoPNV2GPzGsaRXkMxX5Nbnqg1qr8foGzTNgWC0QK78k=;
        b=fDTe/s4MvPjfZ1LfrzOxDMeyblVmyhOe5HttOXajuyHL9IjKLLQGc1LstB8yu/MoJm
         NJYC4yrX0MOi+8qqCCI+WOG4jDKSgpGbw4Q+nnIAlN2UDIjvGLiBhnAyrXhCCVE8meIM
         RqwN7ddwieWvewlngeJNPtKatVA4HbMO5fHvBp7xQkPvxF7OlBLI5uADwvyle1hazOtu
         63J4336ubnbF46JdDqPrplD5CM+wF4vvVk9k7R5MDmYsFyyKwaXqX06creEkQWGk4jna
         ujCJu7fKSoAohGtBQI9SC53XcnBsd4kFCQFSzE+tdl2XOERb1qz2EUk8j+j1fMIUT48R
         fp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763415287; x=1764020087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RoPNV2GPzGsaRXkMxX5Nbnqg1qr8foGzTNgWC0QK78k=;
        b=djx0Ysz2B54PP6T+2/ual0owwGPGVyB50/YCfKRvQaFAYdCNsy8xaKYJrv9qif+Rka
         jOKAsTrAOYD4UbLCGs65owmtcfuUHvn1cTaa30LjZKjgqnlFYYv3rrze76GnCPsmaSH/
         0kiAx1j5uHbCgvmmU1EVY62M/osKshwON8fEbQ9LYPjhELHmvbFdvZw9ubh0HR1iFb3g
         uot/jw3QrrjSsR9LQJzhQEutdjtu6mVBVBGiXO5pAGqsdr1IWTn1WIz8QB9H92CgKbPk
         25ltgt1p7Rw5yTQ/307ivz5F1cWVAez27zTuy+Cj0Wn3OFQ2dgaL+WELAaJGvKSOgdCC
         cTLA==
X-Forwarded-Encrypted: i=1; AJvYcCWJdlg+Jm1dZ7bn8qjQhH5be7pz9rarGREJyUqwY7zhUxhu5udRYcvqpRVruEBvSuL/OlKwxdp4kHsR@vger.kernel.org
X-Gm-Message-State: AOJu0YxDYepK4BLOSnJkaYLWuqkH8q3PTsawxnUx4fdOrg41BetWwaUl
	4fiEom8HGAcIRL2nijMw4fM+U72b5kEGjMmFcI/l8IN0qssN0KfJItq5
X-Gm-Gg: ASbGnctv+EkKN/Y7ruJF0HqBPNydNPdDqkG2jnjhBZFTKyTCdQck+r6/DnMzHNYYN5I
	FOgkxjpqbzapSusoiE0cco6B9mY43ccLDhsfkQg/mG9zHp8/pN132xKOKOgfgNDPmqfMjQ/7/la
	/UYjgeUoQGIrItR5GcB/B93fFxJb69I3ZzcUk/HbwBFUo2Rf10m2WFUHEu8S4mVkK5ogv9u6amC
	ANT9BXHdBRpRfjXATX8Q1QBBW2TyLSJ6Idns1IeAN6aAC6Kq7RobNOObgCtGcj/yXl8rzNCIPet
	pR52wsaz9u5niOVmSjSGwLRMDC59FMxBUTGGQ5XHNx5rQuWfjWkArEFDg79krVv5lKj41QLxwHD
	VdZg9xCKJDclVyLap3wdV28R4Btruvl9BbUl7E1ucbfrnN6bzk65qD3nB8MvsQGwzMrGx44AC6e
	ppJ0daA2ooTtxc85K4+jnPAHWnxz4hxR23GLqqdZ6Lwlm+ARnBfNmU6sEhjr0CRDUxmWpML91HA
	hL+/F2uZqL7fMkWFT+a1WHeSQ==
X-Google-Smtp-Source: AGHT+IFECynbkvL4FMRmGCuZmRY0yMzTy3wQx+LA2SiuQQMsQOCq0mXHtzLJBXNtwXP9lEM/SkzAyA==
X-Received: by 2002:a05:622a:14c6:b0:4c3:b7b0:3317 with SMTP id d75a77b69052e-4edf20f51cemr200167291cf.42.1763415286727;
        Mon, 17 Nov 2025 13:34:46 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee02763778sm60690421cf.32.2025.11.17.13.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 13:34:46 -0800 (PST)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id C8CE7F40080;
	Mon, 17 Nov 2025 16:34:45 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 17 Nov 2025 16:34:45 -0500
X-ME-Sender: <xms:9ZQbaXQd-uV-coyFPE59R7YdQPSWH4QMheVYg8qZGwkTAXS8mBeuvg>
    <xme:9ZQbaUktFh56qWD6N-m612ZR01WaZhnO6sCvtDjO4eG-uVTln4YwkcChskgEObRAb
    5mlabX49pbuTaCL0tJ8udr7UnqVYchCblWuIdcGnfQ4-vigZiyTOQ>
X-ME-Received: <xmr:9ZQbaYMXvpEBVw0XdMmCg82n3MzhQo7RwZPZFlQJHQnAMcIZLVmmwJTj_VoR0--QZQZrPnEY-d07wqREuPnUn1CS95feUqQ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvudelheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeejtdekgfefteehffdtjeelffehkeehheeuveehuedugeetgfekleefjeefieei
    heenucffohhmrghinheptghouhhnthgvrhdrshhtohhrvgenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhht
    hhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquh
    hnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghp
    thhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsfhhrsegtrghnsg
    drrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopehgrhgvgheskhhrohgrhhdrtghomhdp
    rhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgrfhgrvg
    hlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihig
    rdguvgdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hhphgrseiihihtohhrrdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggv
    rggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:9ZQbaQjygVDZblyOaAJiNiRCkt5wKnBKvrln2Q13_KGXtor7LIMh5A>
    <xmx:9ZQbaejTsVzul3qhGQ41cxCULNaqp3rvcrB0deUd9PFLZ3fWJo3guA>
    <xmx:9ZQbaXJ7-PDp731oon-5z57hXZHQA0jeTTVNyZURNzCBX86Ee8I-Iw>
    <xmx:9ZQbaVkJZkus_EpPRnKnsZBgH5TrjpX_pWLj7wemCdXWprzUe7pOdw>
    <xmx:9ZQbaXNvTuWMGJa6vgiQ_r4qBVIYcUDVgcoxjLAcStMAcgFO5VKVS5XA>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Nov 2025 16:34:45 -0500 (EST)
Date: Mon, 17 Nov 2025 13:34:44 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the driver-core tree with the tip
 tree
Message-ID: <aRuU9LM1TijiJRLa@tardis.local>
References: <20251117163033.5fe01a29@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117163033.5fe01a29@canb.auug.org.au>

On Mon, Nov 17, 2025 at 04:30:33PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the driver-core tree got conflicts in:
> 
>   samples/rust/rust_debugfs.rs
>   samples/rust/rust_debugfs_scoped.rs
> 
> between commit:
> 
>   f74cf399e02e ("rust: debugfs: Replace the usage of Rust native atomics")
> 
> from the tip tree and commits:
> 
>   0242623384c7 ("rust: driver: let probe() return impl PinInit<Self, Error>")
>   52af0c37964b ("samples: rust: debugfs: add example for blobs")
>   f656279afde1 ("samples: rust: debugfs_scoped: add example for blobs")
> 
> from the driver-core tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary.

Again, this fix looks good to me. Thanks!

Regards,
Boqun

> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc samples/rust/rust_debugfs.rs
> index 711faa07bece,c45b568d951b..000000000000
> --- a/samples/rust/rust_debugfs.rs
> +++ b/samples/rust/rust_debugfs.rs
> @@@ -36,8 -38,9 +36,9 @@@ use kernel::c_str
>   use kernel::debugfs::{Dir, File};
>   use kernel::new_mutex;
>   use kernel::prelude::*;
> + use kernel::sizes::*;
>  +use kernel::sync::atomic::{Atomic, Relaxed};
>   use kernel::sync::Mutex;
>  -
>   use kernel::{acpi, device::Core, of, platform, str::CString, types::ARef};
>   
>   kernel::module_platform_driver! {
> @@@ -57,9 -60,13 +58,13 @@@ struct RustDebugFs 
>       #[pin]
>       _compatible: File<CString>,
>       #[pin]
>  -    counter: File<AtomicUsize>,
>  +    counter: File<Atomic<usize>>,
>       #[pin]
>       inner: File<Mutex<Inner>>,
> +     #[pin]
> +     array_blob: File<Mutex<[u8; 4]>>,
> +     #[pin]
> +     vector_blob: File<Mutex<KVec<u8>>>,
>   }
>   
>   #[derive(Debug)]
> @@@ -104,16 -111,17 +109,17 @@@ impl platform::Driver for RustDebugFs 
>       fn probe(
>           pdev: &platform::Device<Core>,
>           _info: Option<&Self::IdInfo>,
> -     ) -> Result<Pin<KBox<Self>>> {
> -         let result = KBox::try_pin_init(RustDebugFs::new(pdev), GFP_KERNEL)?;
> -         // We can still mutate fields through the files which are atomic or mutexed:
> -         result.counter.store(91, Relaxed);
> -         {
> -             let mut guard = result.inner.lock();
> -             guard.x = guard.y;
> -             guard.y = 42;
> -         }
> -         Ok(result)
> +     ) -> impl PinInit<Self, Error> {
> +         RustDebugFs::new(pdev).pin_chain(|this| {
>  -            this.counter.store(91, Ordering::Relaxed);
> ++            this.counter.store(91, Relaxed);
> +             {
> +                 let mut guard = this.inner.lock();
> +                 guard.x = guard.y;
> +                 guard.y = 42;
> +             }
> + 
> +             Ok(())
> +         })
>       }
>   }
>   
> diff --cc samples/rust/rust_debugfs_scoped.rs
> index 9f0ec5f24cda,c80312cf168d..000000000000
> --- a/samples/rust/rust_debugfs_scoped.rs
> +++ b/samples/rust/rust_debugfs_scoped.rs
> @@@ -6,9 -6,10 +6,10 @@@
>   //! `Scope::dir` to create a variety of files without the need to separately
>   //! track them all.
>   
>  -use core::sync::atomic::AtomicUsize;
>   use kernel::debugfs::{Dir, Scope};
>   use kernel::prelude::*;
> + use kernel::sizes::*;
>  +use kernel::sync::atomic::Atomic;
>   use kernel::sync::Mutex;
>   use kernel::{c_str, new_mutex, str::CString};
>   
> @@@ -109,7 -114,8 +114,8 @@@ impl ModuleData 
>   
>   struct DeviceData {
>       name: CString,
>  -    nums: KVec<AtomicUsize>,
>  +    nums: KVec<Atomic<usize>>,
> +     blob: Pin<KBox<Mutex<[u8; SZ_4K]>>>,
>   }
>   
>   fn init_control(base_dir: &Dir, dyn_dirs: Dir) -> impl PinInit<Scope<ModuleData>> + '_ {



