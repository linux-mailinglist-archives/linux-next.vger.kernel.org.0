Return-Path: <linux-next+bounces-4180-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB1299638A
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 10:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BEC42822E7
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 08:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB0D18FDBD;
	Wed,  9 Oct 2024 08:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRkGbMOA"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E59318B47D;
	Wed,  9 Oct 2024 08:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463190; cv=none; b=QglmT+M794T4pkwLY3kzLpVojF92PYut7vR6l8DxZUeHUDyXPm8MgbcIh+JmvFMG8B2HW3FOlTROptaGxatHpg/Di6uGrowu04qXvXkGm4PeYbezeo5pi12Xy44mgfVUfwJuQqAHlPkPOZuJpXtjgA6W5LO1KVqrRaW4uUOieAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463190; c=relaxed/simple;
	bh=5Xy/MgpzYyT0zbfYIZC0y7veYiAKPLSZHsypPMtPQy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h1DIbTzgJ0rEHXRURmJfw13eRY9pWWy/WCnAcsQEgOtv+sLMLingKx5mE0M7Hj9/IgG8enmTwClhdrbJxy3rXWYTgDtpLLy2mX8+GrkKH57gaSNwa05IgcVK3fHwYNT2tiU49T7zMlvxBa663/NlcKns4EagS3XnH8Xbdr6d8OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRkGbMOA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C638C4CEC5;
	Wed,  9 Oct 2024 08:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728463190;
	bh=5Xy/MgpzYyT0zbfYIZC0y7veYiAKPLSZHsypPMtPQy0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eRkGbMOAc5Cha1AJZI8Tp/m4XtR+qizMpCFSmmr+49ayzVeS/lJralntAXJwV3ICy
	 ThS5TkGWotiK26wfTdI+sy9MARufn7xLx895eb2A/T6avvV8eVcjQp3uGu+Mdlg2lU
	 zujfDUnvD6O8PC3QUlXpo/l6OSPwCTG5OWsSEEmdjfL/iK8bpfRurAC0JPsBP7rjoV
	 UwrQxycVTqvXJGfOIgvhTEbShJW5vCYnG3SWsOQMS2eDP3YLzAQ4DD0YFnxYroBBE/
	 YblLrrUMUQ8UVacec9vXioHr92wz4Z6P9CXlMENhIkpKCy0jSV9lQXYJcndYywHZaC
	 Yw3w1hisXdE0Q==
Message-ID: <3146cc38-89bc-4930-8c61-1c9c39155468@kernel.org>
Date: Wed, 9 Oct 2024 10:39:45 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the mediatek tree
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
References: <20241009071543.5230cf79@canb.auug.org.au>
 <c97da0be-6924-48de-9cf3-0ba9d5e6a73e@kernel.org>
 <CAHc4DNKx1WLK-QnxTo-f1djCzhRq0MPqD=Z7szHw7+eZAjU1_g@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
Content-Language: en-US
In-Reply-To: <CAHc4DNKx1WLK-QnxTo-f1djCzhRq0MPqD=Z7szHw7+eZAjU1_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 09/10/24 10:19, Hsin-Te Yuan ha scritto:
> On Wed, Oct 9, 2024 at 3:52 PM AngeloGioacchino Del Regno <
> angelogioacchino.delregno@kernel.org> wrote:
> 
>> Il 08/10/24 22:15, Stephen Rothwell ha scritto:
>>> Hi all,
>>>
>>> Commits
>>>
>>>     65b99309a9c1 ("arm64: dts: mt8183: Damu: add i2c2's
>> i2c-scl-internal-delay-ns")
>>>     025869564bf8 ("arm64: dts: mt8183: cozmo: add i2c2's
>> i2c-scl-internal-delay-ns")
>>>     3d3bc7cb46e8 ("arm64: dts: mt8183: burnet: add i2c2's
>> i2c-scl-internal-delay-ns")
>>>     5bbddfd0470f ("arm64: dts: mt8183: fennel: add i2c2's
>> i2c-scl-internal-delay-ns")
>>> (The above also has an empty Reviewed-by tag)
>>>     ca80f75083f6 ("arm64: dts: mt8183: set DMIC one-wire mode on Damu")
>>>
>>> are missing a Signed-off-by from their authors.
>>>
>>
>> The empty R-b happened because b4 didn't interpret "<email>2" correctly
>> and dropped the email entirely. We should probably report that to the
>> authors.
>>
>> Anyway, dropping these commits until Hsin-Te and Daolong clarify what to
>> do here
>> with the S-o-b tags, I didn't notice that the author was different, there.
>>
>> Sorry about that.
>>
>> Regards,
>> Angelo
>>
> 
> 
> There is a "Signed-off-by: Daolong Zhu <
> jg_daolongzhu@mediatek.corp-partner.google.com>" tag for i2c related
> patches  and a "Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>" tag for
> DMIC patch in downstream, but I accidentally dropped it while sending to
> upstream.
> Sorry about that. Should I resend these patches?
> 
> By the way, it seems that Daolong is no longer working for Mediatek, and I
> don't have any way to contact Daolong.
> 

Yes please resend the patches; make sure to keep the Reviewed-by tags, and
also make sure that *your* S-o-B (and the author's) is present on them.
If the author is Daolong, you either take authorship and add him with a
Co-Developed-by, or you ask him to signoff the patches.

Thanks,
Angelo

