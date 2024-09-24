Return-Path: <linux-next+bounces-3957-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7978C984081
	for <lists+linux-next@lfdr.de>; Tue, 24 Sep 2024 10:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F22B81F2258A
	for <lists+linux-next@lfdr.de>; Tue, 24 Sep 2024 08:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3419C14EC55;
	Tue, 24 Sep 2024 08:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="nKwL4KBc"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F1F1487FE;
	Tue, 24 Sep 2024 08:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727166602; cv=none; b=qIapCzwnCumpWhWnwcKKQUFOliQj37aZpWPtrH9V2lw+B+M1B5ntw33OTwKkPKj/RyWhzryjU25PYQnowtwYYW+qQ3hTVEv4yj/kRCj38uW6N/C+C9XUK9k0v+bI/GkK5IcsxK2Xr8Jl8u0pFCwn9nMTYv9FKVPoRqV/jE9VqkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727166602; c=relaxed/simple;
	bh=WpNKHDY+vkTbe5krEau4ttQtmLcQlipkTZIDlgczq3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RVpORLX7o126fpzRf63q+OZsG64Ue8d8JUJYlkC/ziFhN9klAkwb0Ud6+GpM8KwzEMibaywbT4E7bvr6CL0E4O76hYzzUhIxGqU6MbKU3iU7K3oc+UXdqUeuuwenBaIAFU55IMqoaTbMiMu2XnS7I7mQexcocVc9as+gVwc27AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=nKwL4KBc; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1727166591; x=1727771391; i=deller@gmx.de;
	bh=ZW5Y2zJ1VW0ibJTExjGa0ZHgzd+4mmQXdtBEO8V/5EM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=nKwL4KBcbwjF/zy3REMnkDKgZhYgTybALqRAVAcI5mjRed5vqRr6QxRIHzLfpxNM
	 ZMnJ8KpL/Y9N56G25ZR3rX5+FU1CcrFMF/0HTA3yMO88/xiL0OqfqlnoTUKtvK8XS
	 cp15+Rej19x/eWElNhXFAku5reLIqK6cOCbsr9LkzT52+/46mjC/7f3bD52YNwCCz
	 VlT3g3ChqH8eK28xA0NYuYK13C1y7SZUgn1Gu5rTlLTJkqtayyktTgqP12YWgiAyF
	 dg5J/PXLykaFly5Pc/sMHwHC0X1CtRS4y2O1IiTiN4LOBQZqvh++q68mNbGMiKi6q
	 9zZ7H1MGAkDVaYZaQg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXGvG-1sQqJd2gn8-00N3Wr; Tue, 24
 Sep 2024 10:29:51 +0200
Message-ID: <b5b2a18a-f05e-4510-9c58-0efc90277604@gmx.de>
Date: Tue, 24 Sep 2024 10:29:49 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the fbdev tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20240924111607.75ffc555@canb.auug.org.au>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240924111607.75ffc555@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xMU08gsj0SHuUqjyt+FogXbN36cqk9KPvA2qWIq6LCTKzhn0SBX
 j4VA4aYLU6lMLT7y4R2nYVJ10QlXt/i/VJZ5YHABM3VkKQ3Q3kmpP4+1eEQlKCJ3P7rrlAO
 EIuMB2oREupIxpPyGjSBIff34dXIUlbIo9Mh4QX8gFdKEyKPd3/PYlcSio566jC0Ef0gge/
 hhsgfErGmvfAmUJqdilJA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:V4vIk8OmCv8=;q9aylAQYzM546PvTEkevMiuNc0C
 jYwdxIrPlayMrx1BGp8LIveJuqoUHVg62Q4JBylDXa4CR2HRsvxJnMNCIQoI1uJtaFNfQK82g
 4QRZMmBEcgNmbJAckTKb9JfNpSXYYMrqlkHGzX1PB9o/bmm7+Vk8K81uPabgj+85BA3HwHWRt
 SPNFXNKkFCm5lSQak8EdlFPucccJ1ESOmZ1fnnev4F8rHRDXMdRoXa31DPY5l+Kmf/vdPbqCX
 Pz5Xp/lEaJ/LAUqv5NVEY8P3xbaPb4WDP+rfxXkFTNxWFAjPq9/2oFdG9nk7PX/MSsHzFSMuA
 AihCSKxn4YhZiPMpRXV2PlpDCSrpcuxn7xPHVYov6/tpTKMAZXdpcGxffYT2WjRxjrsjO4Y+O
 RhrNdKL+J/E1DzHLHBUC0kkEBPeVbVhHF4/d6Ai5n7pvzAUnJ7E6k8zqNEwz6msheLhhhWBnk
 8osxZ/MNzMZLu/JhR63toCHq7/yAliy/wgY594q99DTtzxLXYWN1CANFM1D4vGoPRq+e1XSHZ
 FJFFsda3ZqZaT8aXCgT65Ty7pecE6B9gA+I16tylGDBnT9ulUWHPTnFhUbWSU2qkXlyY1Nct7
 LlHKQ6T7D9jmav7avrsFhMW4uaXN/84Hkfnf0NQnPBuoWGX45rPVKIetDHEkzf3jmJl5reK03
 7ufFYj3DLIm1hZP7lp9O1Q+aFEnwESe/Z2NHIn31O8nL3y6KZRAIyP8dvmIvuVWXQc+zAWVeM
 u5bowOw4O2e7Am9EyvhpQWzmUv2ik02fhFPPTtmYMz79Hv7M0DUMpua1diHKATwjRB0XoYJm1
 KVBElyJYTuaPkAYiRw4tpT0A==

On 9/24/24 03:16, Stephen Rothwell wrote:
> Today's linux-next merge of the fbdev tree got a conflict in:
>
>    drivers/video/fbdev/core/fbcon.c
>
> between commits:
>
>    d20a9f568f99 ("fbcon: Add an option to disable fbcon in panic")
>    1c1ed27ee117 ("fbcon: Use oops_in_progress instead of panic_cpu")

fixed in fbdev git tree now.

Thanks!
Helge


