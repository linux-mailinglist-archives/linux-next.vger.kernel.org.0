Return-Path: <linux-next+bounces-5138-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76392A08C30
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 10:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A27D7A112F
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 09:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C14220967C;
	Fri, 10 Jan 2025 09:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nAwLqhpg"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C916207A1F;
	Fri, 10 Jan 2025 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736501694; cv=none; b=Z8l1dhL7VCfs/pc/eqSbea6xSl8BdUiD45MpIji+ntEX2evqaJ7RcBTT7bLSxBUskm1P7S5NuKzYm1FzWeHjdefIM3w8ymAaMAAxAsmNL7TFMf3Ig02Fj1+9rMzOTVpik0e5EhhGsymCsBg5ACTE7xaShSquqaIyRxUROLQvM64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736501694; c=relaxed/simple;
	bh=2ku3LC8l603z6xFQxq3H6PLbz3fYK2cIQ3mUGDXbNbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=No10L/xeNtGe/H4vrt69j2XgYPKEoyy8aoZMUTdidDrM5wLer677zRN8TkWi7/Rh0D6kF3T3t30bqFMFXDLyjqgdxWqnT5yvk4evmpjm906I8DPIwNnHHlnkhhuYjOExf5FoJMUb07+Ycl/Wo2Z0lM4XegeggiqI5sjDrY7DV/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nAwLqhpg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D32EC4CED6;
	Fri, 10 Jan 2025 09:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736501693;
	bh=2ku3LC8l603z6xFQxq3H6PLbz3fYK2cIQ3mUGDXbNbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nAwLqhpgsgIyxyeREg7K01AW4fJxsDrIHMA+ILDp906MUPqe/YG4pa3j/v0HrDjdf
	 hT/NlpoC4++TU34BIJRu0gFVqFz877lVSErYAKL9g+NjWDTymEP6MUd6t/cXIUlh4U
	 GeVCHE6QAEV+oS9Qj803NU/iLJKp+/j3ZS2Phj00=
Date: Fri, 10 Jan 2025 10:34:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust tree
Message-ID: <2025011024-clean-refold-b170@gregkh>
References: <20250110162828.38614c1b@canb.auug.org.au>
 <CAH5fLggV5QC53u9xypFga4yheem+7vO=fNqLE47zRj=t_H8eYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLggV5QC53u9xypFga4yheem+7vO=fNqLE47zRj=t_H8eYg@mail.gmail.com>

On Fri, Jan 10, 2025 at 10:28:46AM +0100, Alice Ryhl wrote:
> On Fri, Jan 10, 2025 at 6:28 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the rust tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > error[E0423]: expected function, found macro `kernel::build_error`
> >    --> rust/kernel/miscdevice.rs:159:9
> >     |
> > 159 |         kernel::build_error(VTABLE_DEFAULT_ERROR)
> >     |         ^^^^^^^^^^^^^^^^^^^ not a function
> >     |
> > help: use `!` to invoke the macro
> >     |
> > 159 |         kernel::build_error!(VTABLE_DEFAULT_ERROR)
> >     |                            +
> > help: consider importing one of these functions instead
> >     |
> > 11  + use crate::build_assert::build_error;
> >     |
> > 11  + use build_error::build_error;
> >     |
> > help: if you import `build_error`, refer to it directly
> >     |
> > 159 -         kernel::build_error(VTABLE_DEFAULT_ERROR)
> > 159 +         build_error(VTABLE_DEFAULT_ERROR)
> >     |
> >
> > error: aborting due to 1 previous error
> >
> > For more information about this error, try `rustc --explain E0423`.
> >
> > Caused by commit
> >
> >   614724e780f5 ("rust: kernel: move `build_error` hidden function to prevent mistakes")
> >
> > interacting with commit
> >
> >   5bcc8bfe841b ("rust: miscdevice: add fops->show_fdinfo() hook")
> >
> > from the driver-core tree.
> >
> > I have added the following merge resolution patch.
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Fri, 10 Jan 2025 16:02:19 +1100
> > Subject: [PATCH] fix up for "rust: kernel: move `build_error` hidden function
> >  to prevent mistakes"
> >
> > interacting with commit
> >
> >   5bcc8bfe841b ("rust: miscdevice: add fops->show_fdinfo() hook")
> >
> > from the driver-core tree.
> >
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  rust/kernel/miscdevice.rs | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
> > index 9685e50b100d..3ba018651bc0 100644
> > --- a/rust/kernel/miscdevice.rs
> > +++ b/rust/kernel/miscdevice.rs
> > @@ -156,7 +156,7 @@ fn show_fdinfo(
> >          _m: &SeqFile,
> >          _file: &File,
> >      ) {
> > -        kernel::build_error(VTABLE_DEFAULT_ERROR)
> > +        build_error!(VTABLE_DEFAULT_ERROR)
> >      }
> >  }
> 
> Thank you, this fix is correct. Greg, can you pick this up directly,
> or do you want a real patch?

Can I take this as a real patch for my tree?  Or is this only an issue
due to the trees being merged?

thanks,

greg k-h

