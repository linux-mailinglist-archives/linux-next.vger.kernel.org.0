Return-Path: <linux-next+bounces-8547-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4465ABB5179
	for <lists+linux-next@lfdr.de>; Thu, 02 Oct 2025 22:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A24714E1675
	for <lists+linux-next@lfdr.de>; Thu,  2 Oct 2025 20:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158342848B1;
	Thu,  2 Oct 2025 20:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="NSn/Regv"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA382262FD7
	for <linux-next@vger.kernel.org>; Thu,  2 Oct 2025 20:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759435767; cv=none; b=Ha8dBtjNtDLcO2rL462ZtynnnaY/OfOz1paiKRKw5JP4ULvq+il2rrwTLGOyedOSjBO393uBo+q50ZH8raFMQgbHhaljjGlKyikfbKrRWZI1V5k7IHoHJXdBrFOvAgJT/31nwllNUjJZ4sUfYwsIvX7bXmUXK0YL8qv75vYU4wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759435767; c=relaxed/simple;
	bh=Ijbdc1lJtoKMsyHWvV2qlQUtW/3OiV5a+IRUOMw7ORw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tPhDnSk2TCxXcATgAjj4NLVN4I5HJZ5s/BOs1ngkPPUehDfnHxeVAMXmaNbgGQncCzVtMNdlhSjEDISdZWZzszWmiZn8P2hxI1w5h5GrWL2zs3GJ6QZRG4N+xAg4wHRUZAsxEz+FFQ5lh7MrgIJZEkg5ocfFP+gb6pf2JbIPBuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=NSn/Regv; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1759435755; x=1760040555; i=deller@gmx.de;
	bh=pDcvmXZMzaDX9hgfbniCCqJcGPSmA+Lx7AYUYzgtNpc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=NSn/RegvJVIGL2TKtpQrhHZhUDguxNSzsXemk8YnsL2mxlaEhw/y58DzkGy8NvyS
	 ce7HBOednbQ0pZbARirw7Fo/UXD05kWreogvHMyKGXtg3koW9k2L73vHlWAaVl6sS
	 Rnuu5eEUAzC2VQHjl/2rlpX/btTGxpSDH7Jh8ZFKkyVhCo6Gvs6ALVoRnlDV5E3DY
	 YWS7nLPIRmgzsa/Ybeb638yp2PiawkCXpoIGzQKOlqrQQlnrtZnri+RmmDa+xA9E6
	 r3LKQAw4sDrZT6wPFImAZ8f41X764j83WXnd8PfS+g6gIDhulCCwBg619bvCyyMoJ
	 nGrz+/2uiXeuj5FvDg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.64]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrQJ5-1uY7Sf3agJ-00cptF; Thu, 02
 Oct 2025 22:09:14 +0200
Message-ID: <798e10eb-b32e-451a-812f-ee752f22f0fb@gmx.de>
Date: Thu, 2 Oct 2025 22:09:14 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the hyperv tree with the fbdev tree
To: Wei Liu <wei.liu@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mukesh Rathor <mrathor@linux.microsoft.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>
References: <aN6k79cY8mKSrKQq@sirena.org.uk>
 <a8e320dd-37de-4738-bd6b-74a6884dec74@gmx.de>
 <20251002200523.GA925245@liuwe-devbox-debian-v2.local>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251002200523.GA925245@liuwe-devbox-debian-v2.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:98ROANWWvavbF6R7Di4qOxvqQ4lR5kJ3Xf5ztR02UKD0pcOIo0V
 RpHVbuW0cUOfM1ywDWYPW2XQ49yec8nAkubmLkWZF5i86DRyONIynkBV8Z7a/rY2KduSl6d
 fTwiJZG/SPH4ZE3tqwOTcsN0sfAySSrl4ux3qFdVQ6QJKj00XcXomglrmR41AuMM9uqfA5S
 BXVLLxF11SWxsfn0y3qMA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eiIUOHpP5PM=;sz1hILlPLMj24UNbpjYB7qCEmRu
 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

On 10/2/25 22:05, Wei Liu wrote:
> On Thu, Oct 02, 2025 at 09:41:58PM +0200, Helge Deller wrote:
>> On 10/2/25 18:14, Mark Brown wrote:
>>> Hi all,
>>>
>>> Today's linux-next merge of the hyperv tree got a conflict in:
>>>
>>>     drivers/video/fbdev/Kconfig
>>>
>>> between commit:
>>>
>>>     9e84636785c5e ("fbdev: hyperv_fb: Deprecate this in favor of Hyper=
-V DRM driver")
>>>
>>> from the fbdev tree and commit:
>>>
>>>     94b04355e6397 ("Drivers: hv: Add CONFIG_HYPERV_VMBUS option")
>>>
>>> from the hyperv tree.
>>
>>
>> Wei, I have those two patches in my tree:
>>      MAINTAINERS: Mark hyperv_fb driver obsolete
>>      fbdev: hyperv_fb: Deprecate this in favor of Hyper-V DRM driver
>>
>> Please let me know if I should drop those.
>> I'm fine if you carry both (or any) in your tree.
>=20
> I can carry both. That simplifies things.

Ok. I drop both.

Thanks!
Helge

