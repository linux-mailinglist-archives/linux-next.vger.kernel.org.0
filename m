Return-Path: <linux-next+bounces-9134-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 38154C774DC
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 05:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 82FF734678E
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 04:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B506280327;
	Fri, 21 Nov 2025 04:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="GVjAO+vY"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFCA26ED45;
	Fri, 21 Nov 2025 04:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763700617; cv=none; b=lEq0vcoF+Er+Oc9k1f+4o10EYnx7r7r5OpEiZ6qRYtPMjooIR7ZmUH337i2UoZPhqSDyF07MIjwIu6xngPoWaBlJZx9dkGVRZXOknO6XMB1sZe4MYA1Ri49xBmeSi09DC/YQdMfPxkX17HQ71Vyn4VLR6g+sr4+XOY2s4s8V+iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763700617; c=relaxed/simple;
	bh=hMxJIVoq/YzZYNQ89D2grwyYKUlpk125AcHsSzZ0geo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=htrIahfcGggGhHn1kiq+Y4X/0bT3JsL4IN3X8Nf1p6Z5sR8awxMaylnCD24gvX5ov1+Bi+o+CZBvGViWXW/uwsEuqZIjbEQhuWTnl8AvW7WxKcGkqKcO4twIfQt9sV+DiFwz38+MNm0nb2tyUDnPVCr6TJHQnwCWRbm5nd7dTQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=GVjAO+vY; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763700595; x=1764305395; i=w_armin@gmx.de;
	bh=116pstvaxY2JhXiTuNkkQ8cp4VI7rcrm1w3YTZq+QYk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=GVjAO+vYDfQpKYTxkEIQkCkbGcgrCU3ttFNAW113e9mwleeanVQhYAzLTZjXWtFw
	 uLjRib5AFfUyYgvBoOZv0Zv5e6uGG9zMQO7CLADaWe+/b9kpqK3PK82q7PWZ0bCLX
	 OGqZ27vCoD97UEOFM/rVwGJ5sRuBvb+EaGWiw/+SUzwDD+sVylajj1PqQLMRrz5jJ
	 6i0W9t3W9+JqLL1pQurd1CvD/GHPNlD87Ne1zZ+iI2FjNzSQXM8qW5IA/bYoC9G8M
	 CQSEspKnKuZRTXJmQRO8kSNihXV/GU7g5j0oFv37ZxzaEP3c9bW++nxHjGQKHp7rL
	 AHBZt82I4d07ni7slQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mel3t-1vtzHi0Yrd-00fIRU; Fri, 21
 Nov 2025 05:49:55 +0100
Message-ID: <6465e1ba-54e2-4823-b8e7-d3f12b11fd10@gmx.de>
Date: Fri, 21 Nov 2025 05:49:51 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the staging tree with the drivers-x86
 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251121142512.371a77fe@canb.auug.org.au>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20251121142512.371a77fe@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:EOUthAYDtJSh96MPnqjkGfxEMYp6YAfir0jFCVEktQO7uy8KP4w
 /Fl2FzxSHumFbSxioD1mZ57jcR52FxHeiSKEFcaqTxVyeqYagP1BmEw65MDoRc+UR5zqdqW
 LbAzTxWUnVH/ZCclqISlqWvNSxwEribZsaP38n0gHv0kRsMSyAnF7fDkVGcCBBe9A5DU8kK
 mdsmycHcNwDDStpYBrWGQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/NTi8zQGaxo=;saKLGhxgbaZoMc/+Eym4nArhMPe
 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
 aJSWph0EH/4knd1TXCJdItCpVEzD6VO6lB0UZU

Am 21.11.25 um 04:25 schrieb Stephen Rothwell:

> Hi all,
>
> Today's linux-next merge of the staging tree got conflicts in:
>
>    drivers/platform/Kconfig
>    drivers/platform/Makefile
>
> between commit:
>
>    e2c1b56f3dfa ("platform/x86: wmi: Move WMI core code into a separate directory")
>
> from the drivers-x86 tree and commit:
>
>    aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")
>
> from the staging tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The fixup seems fine to me as far as the WMI driver core is concerned, but
the entries for the Raspberry Pi seem to contain some leading whitespaces.

Thanks,
Armin Wolf


