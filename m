Return-Path: <linux-next+bounces-8812-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 323CBC3011E
	for <lists+linux-next@lfdr.de>; Tue, 04 Nov 2025 09:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D0A7F34DDF6
	for <lists+linux-next@lfdr.de>; Tue,  4 Nov 2025 08:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCDDD26ED3F;
	Tue,  4 Nov 2025 08:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eToozsEt"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A309A3FCC;
	Tue,  4 Nov 2025 08:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762246364; cv=none; b=ucB8u8pddw10jL6Mvk01Orn21CByZbjve/EujwD6adMIsvPrRcQH15sStXCRcEUydfU64xiHNPajwhnr3cVq1Xs1mfCi/QDX+HackCOWAA7QDsixKOWLkx0DhVlE/M6JTcVw3j1HDZcBOv/mgcRrYo5UPp/79cfP/wHESgEpHbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762246364; c=relaxed/simple;
	bh=WF/zlLlpEJhAsaTH3NSuhuskPpUsy2F/aSE6n5sJB/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s/jbzpEOghK8x+4yJEdD2mk5/nm+Ykzj+SvT/oe0lNF5qL6IlbCJ6GWMTtLYl8pZrosv29kOZhrDqG3iTjhCq8i33QJC9s7Adg/UHyU81+jSpD8Djqjbc1nHeuTEjjO4dc/DknY0KrlKf2oe0DeW7MRdjOxoUyq12FNE3g4blvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eToozsEt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D4DC4CEF7;
	Tue,  4 Nov 2025 08:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762246364;
	bh=WF/zlLlpEJhAsaTH3NSuhuskPpUsy2F/aSE6n5sJB/A=;
	h=Date:Reply-To:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eToozsEt0RIhc9vtbCDziOTTtHHTI6uOD+ZlZRtgTNiRW7qK05j4JTHOYDtd8Ryxj
	 oBrdF902xKXtKIeQVEgQtWdH0z+Y5hU+oCKcTw0L0GC/BdFGnSBswPbm55+08/0u77
	 XfvyCN5xr5Aj3jXedu0PZF76wrCVZYGZQKMYGEWpdEZ+nWpXTlkNnxN8r1sG3yGe4L
	 bKae4gq6DCzLc+pBvhKwoE1LtzufdEhO34Qf38hQpwFHtvTSb3I4BQ9Wqk8lYzMLf7
	 xLRxGFqZ/PiGfaakf1xWI08dBZoLI8SUmF89IKTewG6irX8tvSXFSBmdn4jeg1s4wq
	 i5ObDGBMnKwuQ==
Message-ID: <13c0ac62-cfa9-4b96-9cfa-807def89593e@kernel.org>
Date: Tue, 4 Nov 2025 09:52:40 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Daniel Gomez <da.gomez@kernel.org>
Subject: Re: linux-next: manual merge of the rust tree with the modules tree
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>,
 Daniel Gomez <da.gomez@samsung.com>, Andreas Hindborg
 <a.hindborg@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Tamir Duberstein <tamird@gmail.com>
References: <20251104105516.40fea116@canb.auug.org.au>
 <CANiq72kP0YMCEMjEVdTfVt4eokbXm6iRAk2PxmFZybNgJaFzGA@mail.gmail.com>
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
Organization: kernel.org
In-Reply-To: <CANiq72kP0YMCEMjEVdTfVt4eokbXm6iRAk2PxmFZybNgJaFzGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 04/11/2025 00.59, Miguel Ojeda wrote:
> On Tue, Nov 4, 2025 at 12:55 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the rust tree got a conflict in:
>>
>>   rust/kernel/str.rs
>>
>> between commit:
>>
>>   51d9ee90ea90 ("rust: str: add radix prefixed integer parsing functions")
>>
>> from the modules tree and commit:
>>
>>   3b83f5d5e78a ("rust: replace `CStr` with `core::ffi::CStr`")
>>
>> from the rust tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
> 
> Looks good, thanks!
> 
> Cheers,
> Miguel

Yes, looks good to me as weel. Thanks!

