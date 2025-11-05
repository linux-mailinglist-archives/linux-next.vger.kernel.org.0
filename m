Return-Path: <linux-next+bounces-8838-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B30D2C3408F
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 07:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EE1918980CA
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 06:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53381E0DE8;
	Wed,  5 Nov 2025 06:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmiLw97F"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE83176ADE;
	Wed,  5 Nov 2025 06:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762323348; cv=none; b=jtNyNkir8j5I79DcpXWo9DM7AnXL93Qfib0FyuqJXvkUMj55MJ1/h7W4QI+mVUROmUphengsqVj9qizs/Fs0A0xlUiE4r0Srb7qRxTAft8V9qynLGidsNp8KZQ/yUFhxvlXqDquJ4NiNr4MFXGHjmbUA2jkbuTNk+9hAcgRL0RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762323348; c=relaxed/simple;
	bh=KpjbRQFxIyOisY/LHVDMX3+nkTP7nXBhrrbtyUKrUnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z+Q5KSFB+IsoZjvEuxPyUnshiqbmbywXa4ydaT510lUvOiUlpVM4rjIKW+tUItzzm5jWwOF+vj8T/BAJIGNEjasg2rq58HQOENMJd0A4IDuNcBrqxNVJgDPeQPmOqrLdBdt5BAkdCHTgO882mwQYGqVEPE1Gn7/ZXMkxLWUhj0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmiLw97F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0791DC4CEF8;
	Wed,  5 Nov 2025 06:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762323347;
	bh=KpjbRQFxIyOisY/LHVDMX3+nkTP7nXBhrrbtyUKrUnw=;
	h=Date:Reply-To:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QmiLw97FVTSk2yo00R9099r4Iro/AIHUvZymgMWaIQMkM5E1LZSdWl3dkzevw7WiH
	 XFyZi0u6+2eaHZPdFi0jv/NXLu18I5aNEPrC2h99uI3L0/00Uz9xW8jDdXVOi6aHLT
	 WcLjlv5wTBx+T06U8/u4cl8+YxDi5ni6EvkVfh4xa+iv6UeaHoMILyNWiCZcTXVEZV
	 e2ZxXuHy/BOtcv3o9jizA5IUlV3PL1XEnN3KI45Z4aYTR5kercsIXfOibHsdC9g2yu
	 BlqKuJyynG9DAe+EWZqHO++gnKMlyJ+dy9hJgM8rRk5ZXkcIm9mk60OBY3zqv9haTg
	 7OULro1uigftw==
Message-ID: <4df805bf-10fd-4fb3-ae34-44185c305d47@kernel.org>
Date: Wed, 5 Nov 2025 07:15:42 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Daniel Gomez <da.gomez@kernel.org>
Subject: Re: linux-next: build failure after merge of the modules tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251104154500.5acb5340@canb.auug.org.au>
 <20251105155109.1b3fc7d8@canb.auug.org.au>
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
Organization: kernel.org
In-Reply-To: <20251105155109.1b3fc7d8@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/11/2025 05.51, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 4 Nov 2025 15:45:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the modules tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> error[E0308]: mismatched types
>>   --> rust/kernel/module_param.rs:75:47  
>>    |
>> 75 |         let new_value = T::try_from_param_arg(arg)?;
>>    |                         --------------------- ^^^ expected `&BStr`, found `&CStr`
>>    |                         |
>>    |                         arguments to this function are incorrect
>>    |
>>    = note: expected reference `&BStr`
>>               found reference `&ffi::CStr`
>> note: associated function defined here
>>   --> rust/kernel/module_param.rs:32:8  
>>    |
>> 32 |     fn try_from_param_arg(arg: &BStr) -> Result<Self>;
>>    |        ^^^^^^^^^^^^^^^^^^
>>
>> error: aborting due to 1 previous error
>>
>> For more information about this error, try `rustc --explain E0308`.
>>
>> Caused by commit
>>
>>   0b08fc292842 ("rust: introduce module_param module")
>>
>> This is some interaction with something later in linux-next - presumably
>> commit
>>
>>   3b83f5d5e78a ("rust: replace `CStr` with `core::ffi::CStr`")
>>
>> from the rust tree.
>>
>> Hopefully someone can provide a resolution for me tomorrow.
>>
>> I have used the modules tree from next-20251103 for today.
> 
> I have used the modules tree as is and applied the below merge
> resolution patch (supplied by Andreas) to the merge of the rust tree.

Yes, that is the correct resolution. I tested that yesterday when I contacted
Andreas and Tamir.

Thanks


> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 5 Nov 2025 14:52:29 +1100
> Subject: [PATCH] fix up for "rust: replace `CStr` with `core::ffi::CStr`"
> 
> interacting with commit
> 
>   0b08fc292842 ("rust: introduce module_param module")
> 
> from the modules tree.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  rust/kernel/module_param.rs | 1 +
>  rust/macros/module.rs       | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
> index e7d5c930a467..6a8a7a875643 100644
> --- a/rust/kernel/module_param.rs
> +++ b/rust/kernel/module_param.rs
> @@ -70,6 +70,7 @@ pub trait ModuleParam: Sized + Copy {
>      // SAFETY: By function safety requirement, val is non-null, null-terminated
>      // and valid for reads for the duration of this function.
>      let arg = unsafe { CStr::from_char_ptr(val) };
> +    let arg: &BStr = arg.as_ref();
>  
>      crate::error::from_result(|| {
>          let new_value = T::try_from_param_arg(arg)?;
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index 1a22de73d512..f6a94712384f 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -133,10 +133,10 @@ fn emit_params(&mut self, info: &ModuleInfo) {
>                          ::kernel::module_param::KernelParam::new(
>                              ::kernel::bindings::kernel_param {{
>                                  name: if ::core::cfg!(MODULE) {{
> -                                    ::kernel::c_str!(\"{param_name}\").as_bytes_with_nul()
> +                                    ::kernel::c_str!(\"{param_name}\").to_bytes_with_nul()
>                                  }} else {{
>                                      ::kernel::c_str!(\"{module_name}.{param_name}\")
> -                                        .as_bytes_with_nul()
> +                                        .to_bytes_with_nul()
>                                  }}.as_ptr(),
>                                  // SAFETY: `__this_module` is constructed by the kernel at load
>                                  // time and will not be freed until the module is unloaded.

