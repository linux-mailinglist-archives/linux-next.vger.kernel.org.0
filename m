Return-Path: <linux-next+bounces-4983-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 710FF9F45CD
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2024 09:15:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8303161A93
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2024 08:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A4F1DC18F;
	Tue, 17 Dec 2024 08:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="fiNC0Pbx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Tlhr1zge"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF721DB92E;
	Tue, 17 Dec 2024 08:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734423323; cv=none; b=mli5+st2RSenD1+lqJtyo1HveCWaPwm7wB5ZvmKRcQh8fa3IZzYoGvkNr5jQ4ySMyaRs5/joqNHn43VOUWMdQwiLRd60+beq2tftJmgnK28Jj2dGCuKKnPItb1ULUY2+9DNAddKaZo53QQOhYuhwn3b2/ZCioiutM/PUk9pmdYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734423323; c=relaxed/simple;
	bh=RZFjA/9pFaFrpZKI8dauHwC00La1Hwup0bHnM6qCJFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2QKix18K0eR/SZNaab1qLWBV3vLKY/mxLgE/r0nQXFU9+IHAa8dpw1JXZ73R9K9tAGXGPqcm5KwjzVdR7H+5Ox3XjytfYBWkkaB5rLtpb8aa9ShhnqcHKP6to8f7j9l/rCo/BwS+Bsxj3mXBgOxNmbSBCpTiTm6ciChQzkcLHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=fiNC0Pbx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Tlhr1zge; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 09D65114024E;
	Tue, 17 Dec 2024 03:15:19 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 17 Dec 2024 03:15:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1734423319; x=1734509719; bh=jfv9FlKh9f
	dbsgM66OV20rMDFf+HbpGSmfPytK2iVvE=; b=fiNC0Pbxby2qIMstus41OQ6MQs
	9cnH2irYrZ8F4GgOqsXGNFlg4y+kwakmIyYxUQb/vhncvaiQfIz8nJCUOmGZPbvL
	CUmP32neMSd2nt+AqmBq+IhmG01BalY7wyTGbEjDWLCPyz/MwgAWhANElxZ9eiyu
	sGO4DUgub4qoltuzTw3DEzbxQq+hNKamp+lyFoyS2PkKX5MrkH5Q0xIa0OiDTelu
	FyLmDTegU7mD8MLInx3U7D+200lb08aI4T6cIYZ/kmwxUciPTlEqnOYrbpZilSCr
	XyFDTNjrMXqNTBlkOoEjWsyYOm3A8sjBSf3Qc9rHs40KCNdf9Mx7/6KrZC7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1734423319; x=1734509719; bh=jfv9FlKh9fdbsgM66OV20rMDFf+HbpGSmfP
	ytK2iVvE=; b=Tlhr1zge2i9HkUSRvdN5sZS2xBdEdx311C9Qul3Mf9AZNcXKDmb
	xmEFH2v/R37zdR96+nds5UF9ueO3UQusg2M8A3bxzNKkB9HDc2wMqiXAQ8sF9eCY
	PrKogvCjKtqOCgEZ1PiNzvppsc0NVFTFsUaQke71aQBEBzsRbq7IXx+u7oflxDEy
	qvYU6Or0Q+Fwk9wcV2dG4aXUkgP7lxcuPWx32TWIBdGFfKqRpicNPEksbCwhC7Pp
	XCVZu2LbTCNaxughcm7MW8EQTI21tFg1y6NvLonjMJhIK5p9ssO0FG6dAMwVbqXb
	6YCEnTt9kxWxPWvuUq5+njwiaIDML0ZZaqQ==
X-ME-Sender: <xms:FjNhZzLJLH7BXvYJExOt7Q0M0TwQy5bmRoHVU3bZvKsRVqknhVmpuw>
    <xme:FjNhZ3Ky4hM_iJg5SUfq303aQNN_UtV7l8-kUXhPZxbD5CDXIGF0CFozQvk3a2fHJ
    -oLqgB2k-BqWg>
X-ME-Received: <xmr:FjNhZ7u-UHh4l6jwvwcNCJHVQMfqQnbqeUTwwX-oKyJmEajGUwXTSbsA8VLfwmKfebAZP8KjiUK7BSIuTHgPCxvYAwos0z1xE4_gUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleeggdduudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
    gfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeduvddpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupd
    hrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgt
    vghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguh
    hordhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:FjNhZ8ajBAnK96RBp1LsCbQpiZki3Ovh1XL4JlgFsIhJiKy7_UtixA>
    <xmx:FjNhZ6Zj6ezdWaLiGsIZOFzUvkyXJepHp18_bh-9OqooXRdtC6Y1Rw>
    <xmx:FjNhZwAu1eAd69gdFJy9uRzJXojHPHjWEG1xK0_ScP8wzpC9FefrGg>
    <xmx:FjNhZ4YnthwmGMianFfphna3DZdmvN10L0pb3tbOaja_XEIs8C8WOg>
    <xmx:FzNhZ2QV84VzG_3RvFSXJV_qAMCkRthMTG1mgxwjplPCl4Tu0XfviYos>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Dec 2024 03:15:17 -0500 (EST)
Date: Tue, 17 Dec 2024 09:15:15 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Gary Guo <gary@garyguo.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core
 tree
Message-ID: <2024121706-turbojet-siren-975d@gregkh>
References: <20241217140939.08167c85@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217140939.08167c85@canb.auug.org.au>

On Tue, Dec 17, 2024 at 02:09:39PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rust tree got a conflict in:
> 
>   rust/kernel/miscdevice.rs
> 
> between commit:
> 
>   0d8a7c7bf47a ("rust: miscdevice: access file in fops")
> 
> from the driver-core tree and commit:
> 
>   27c7518e7f1c ("rust: finish using custom FFI integer types")
>   1bae8729e50a ("rust: map `long` to `isize` and `char` to `u8`")
> 
> from the rust tree.
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
> diff --cc rust/kernel/miscdevice.rs
> index ebc82e7dfc80,8f88891fb1d2..000000000000
> --- a/rust/kernel/miscdevice.rs
> +++ b/rust/kernel/miscdevice.rs
> @@@ -10,11 -10,9 +10,12 @@@
>   
>   use crate::{
>       bindings,
>  +    device::Device,
>       error::{to_result, Error, Result, VTABLE_DEFAULT_ERROR},
> +     ffi::{c_int, c_long, c_uint, c_ulong},
>  +    fs::File,
>       prelude::*,
>  +    seq_file::SeqFile,
>       str::CStr,
>       types::{ForeignOwnable, Opaque},
>   };
> @@@ -274,12 -225,7 +270,12 @@@ unsafe extern "C" fn fops_ioctl<T: Misc
>       // SAFETY: Ioctl calls can borrow the private data of the file.
>       let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
>   
>  -    match T::ioctl(device, cmd, arg) {
>  +    // SAFETY:
>  +    // * The file is valid for the duration of this call.
>  +    // * There is no active fdget_pos region on the file on this thread.
>  +    let file = unsafe { File::from_raw_file(file) };
>  +
> -     match T::ioctl(device, file, cmd, arg as usize) {
> ++    match T::ioctl(device, file, cmd, arg) {
>           Ok(ret) => ret as c_long,
>           Err(err) => err.to_errno() as c_long,
>       }
> @@@ -299,12 -245,7 +295,12 @@@ unsafe extern "C" fn fops_compat_ioctl<
>       // SAFETY: Ioctl calls can borrow the private data of the file.
>       let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
>   
>  -    match T::compat_ioctl(device, cmd, arg) {
>  +    // SAFETY:
>  +    // * The file is valid for the duration of this call.
>  +    // * There is no active fdget_pos region on the file on this thread.
>  +    let file = unsafe { File::from_raw_file(file) };
>  +
> -     match T::compat_ioctl(device, file, cmd, arg as usize) {
> ++    match T::compat_ioctl(device, file, cmd, arg) {
>           Ok(ret) => ret as c_long,
>           Err(err) => err.to_errno() as c_long,
>       }


Looks good to me, thansk!

greg k-h

