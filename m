Return-Path: <linux-next+bounces-9739-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AE068D3C4F8
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 11:20:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CDCE6724146
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 10:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB043E959F;
	Tue, 20 Jan 2026 10:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3l/zJ7A"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FF03DA7DC;
	Tue, 20 Jan 2026 10:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768903299; cv=none; b=EA0hfzPP2tULCUyVqqHuFrcpwhKoHl3a9CKPMn5KRD8SNXGBHcXWPDzWnWX3KhhuFCQSC2nWAla429HimUTgQTl7/sM0xOhbQo7ysNhvHlbx/ZoTzG57IGTkLtj/Bo/OFq/K+GhrcFqaENCi/TT0OYD2iNLMBGzQHwBozVj76sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768903299; c=relaxed/simple;
	bh=R6SZUTJLYkGCpR9oPkzcXnZNDdBlz4WNQ1uYTr7murY=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=uBWAH+qb+GsThHM49jeQA4e5bhFYVMj2TMhtgKBjKeItOSdHY/2x6AzeLuvEeBFWBlbODaudNnoDWxnuceJB2pOvo7ykWwoqVHX60JnuzTHzni6jxnJLbXV0TBr42fLfz81Ls4EQdpGt9nQVU2MXdqeFXYokpkaPPqsP+WdaonQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3l/zJ7A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A1DC16AAE;
	Tue, 20 Jan 2026 10:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768903299;
	bh=R6SZUTJLYkGCpR9oPkzcXnZNDdBlz4WNQ1uYTr7murY=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=D3l/zJ7AhwT7GvaC9mtiWJMfWZ89OlWazordVluLoKWgV2B/P8ISeJg0wYfUiSEMX
	 pEDrLf1wmhlaa+XCMScYSwHk65FtSW5eT4MYizCQ4JA7zOkn/CYdEXWRkXrWw609MA
	 anZ/sTW3cqHy0KhWFBnpf+ko3LHGJRtZ4z0aw42GYMmogToFVFVTXLAEBauzWN1jow
	 SPAwBcP3tuQgtTjxAS/T/rNh4cmiiDxzeUDexuZoOw+DLelLOeMCTXZLxgczgxr8De
	 gwU3tT/+NpJqiN7uvsWzExQmFuRew0bP2pv4yuPBKPKmWh84L5wT6VjmGwcklX17DQ
	 2u8R+Vw/R+kVQ==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 11:01:35 +0100
Message-Id: <DFTBVVNMJ0DP.A5N8QH75OPQ@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: linux-next: build failure in final build
Cc: "Mark Brown" <broonie@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Deborah Brouwer"
 <deborah.brouwer@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Linux
 Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next Mailing
 List" <linux-next@vger.kernel.org>, <boris.brezillon@collabora.com>
References: <aW6wfOjd17D5tUC5@sirena.org.uk>
 <DFSXL1I12WPM.BDODUQNYLEPJ@kernel.org> <aW8-oH7dtp-OTAZC@google.com>
In-Reply-To: <aW8-oH7dtp-OTAZC@google.com>

On Tue Jan 20, 2026 at 9:36 AM CET, Alice Ryhl wrote:
> On Mon, Jan 19, 2026 at 11:49:10PM +0100, Danilo Krummrich wrote:
>> (Cc: Boris)
>>=20
>> On Mon Jan 19, 2026 at 11:30 PM CET, Mark Brown wrote:
>> > Hi all,
>> >
>> > After merging all trees, today's final linux-next build (arm64
>> > allyesconfig) failed like this:
>> >
>> > error[E0560]: struct `drm_panthor_gpu_info` has no field named `pad0`
>> >   --> /tmp/next/build/drivers/gpu/drm/tyr/gpu.rs:75:13
>> >    |
>> > 75 |             pad0: 0,
>> >    |             ^^^^ `drm_panthor_gpu_info` does not have this field
>> >    |
>> >    =3D note: available fields are: `selected_coherency`
>> >
>> > Caused by commit
>> >
>> >    8304c44631c37 (drm/tyr: use generated bindings for GpuInfo)
>>=20
>> I had a quick look and the problem is that another tree (drm-misc-next) =
changed
>> the corresponding uAPI struct in commit ea78ec982653 ("drm/panthor: Expo=
se the
>> selected coherency protocol to the UMD") without also changing the Tyr d=
river.
>>=20
>> This diff in Tyr should fix the problem:
>>=20
>> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
>> index 3072562e36e5..0c85f03b8a7d 100644
>> --- a/drivers/gpu/drm/tyr/gpu.rs
>> +++ b/drivers/gpu/drm/tyr/gpu.rs
>> @@ -72,7 +72,7 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<=
IoMem>) -> Result<Self> {
>>              // TODO: Add texture_features_{1,2,3}.
>>              texture_features: [texture_features, 0, 0, 0],
>>              as_present,
>> -            pad0: 0,
>> +            selected_coherency: 0, // Some variant of `enum drm_panthor=
_gpu_coherency`.
>>              shader_present,
>>              l2_present,
>>              tiler_present,
>
> Yeah, if that diff can be made in the merge commit, it should solve the
> issue.
>
> If it's easier, we could merge a commit into drm-misc-next that renames
> pad0 to selected_coherency. That would trigger a merge conflict on the
> relevant lines of code.

I think that would make sense as this way it also becomes obvious when the
changes are pulled into the parent DRM tree eventually.

