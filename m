Return-Path: <linux-next+bounces-6672-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C09AB2C0D
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 01:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9C1816EF57
	for <lists+linux-next@lfdr.de>; Sun, 11 May 2025 23:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3319D18CBFC;
	Sun, 11 May 2025 23:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="rwf1OP67"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EE72905;
	Sun, 11 May 2025 23:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747004446; cv=none; b=XDjnLL3qNflsMQJsPZnGsyWpvqaLk7F9/twKuFOsXMdM8d7scvDsE8Dm2RmAD8Cd+xRE8f/N9PLXd/4mIdWVEQ+2iaxHx95m/c6WTnpltz6TxqAYNOsgb1BbIh7NJi6l95QblClqlK1oD8RI9n3PiLe8agUE5wsTp3V56wdYJw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747004446; c=relaxed/simple;
	bh=P4iJnELmZ5F53wgKldMyawx0mOuutAnVumZrcp3mRRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nOVSn2jIrgxJwdqgZkk9AiHIWgRNdMbtmiLAPux6m6/9hCJRs+wBrfwqnWdzkyqccUDm/OV7BaF4BTM5m/PcGg9Nq0jTFOyHYMfNiL3BBxF9tWH2xDpK8zqQ/Yk0mMRt0GcYLn1pnVl5NbPrAvlkUt3Lrji+Ln6eeE/Jq1nOiGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=rwf1OP67; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1747004431; x=1747609231; i=w_armin@gmx.de;
	bh=P4iJnELmZ5F53wgKldMyawx0mOuutAnVumZrcp3mRRo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=rwf1OP675y8zKkCTt/k0QiMoxxVcYzN/8sc+NSsfkcPDYCqZAhnT2UdT811IFeOR
	 AW4UZ+gaKJhKpYAXlJErmzIoAqPkuL+Vvl3VYIfjLEDc9iP99WN33/GN7yOF4o3G2
	 tg9urzgJinQc/wPi+/z4/SlAuW91egEJzSVR8tRkHHNip9mMuAdZQXIPENT3ZJKCp
	 rpAj7+cpx7JrjXzrS0T4qhi6CTDxLdcUBa05dneqKT4uL4IlFeqj0e/JUGcnenCJM
	 bUBnHUVSJ347Hs093w+gdPyt80rF1ppO8O0XRcYAA5i9ZYBKNrLMveJXn9QdMxoKk
	 moAnZACI0CVLAqplmA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3DJv-1uHGSY1MmT-001nWF; Mon, 12
 May 2025 01:00:31 +0200
Message-ID: <52a2c1f9-0267-42d0-8e46-31eea58f88a8@gmx.de>
Date: Mon, 12 May 2025 01:00:28 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for May 9
 (drivers/platform/x86/tuxedo/nb04/wmi_ab.o)
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Werner Sembach <wse@tuxedocomputers.com>,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250509195816.7f0a67a3@canb.auug.org.au>
 <a1d9134f-0567-4a53-a1e7-a55cd6b189a9@infradead.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <a1d9134f-0567-4a53-a1e7-a55cd6b189a9@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:0PGp9KkmBeWtmDkJC2HVVGIzhwbOJi2S1EkAy8z8EDRbws1HrSk
 ZOtnWksaDoas2Wl4CrN6psjaGjmk+z0YF7pd6WF7WsnJLZ/erlGazGd7jvEL8MjJgcv3NuY
 V3aW6DFSFlbkrTcsNCX0nZnd85RhDqlNikfSFDHkTR15rBV3JV+etMTlToVDKXcBDifGFzn
 gBAgj9cjgkwD6HDvAXefw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aet/ldG/ex0=;N9j4+79R+ctt8NtF4dbaC4wwzSd
 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

Am 10.05.25 um 03:35 schrieb Randy Dunlap:

>
> On 5/9/25 2:58 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20250508:
>>
> When CONFIG_HID is not set:
>
> ld: drivers/platform/x86/tuxedo/nb04/wmi_ab.o: in function `tux_remove':
> wmi_ab.c:(.text+0x29): undefined reference to `hid_destroy_device'
> ld: drivers/platform/x86/tuxedo/nb04/wmi_ab.o: in function `tux_probe':
> wmi_ab.c:(.text+0x6a): undefined reference to `hid_allocate_device'
> ld: wmi_ab.c:(.text+0xbc): undefined reference to `hid_add_device'
> ld: wmi_ab.c:(.text+0xf3): undefined reference to `hid_destroy_device'
> ld: drivers/platform/x86/tuxedo/nb04/wmi_ab.o: in function `tux_ll_parse':
> wmi_ab.c:(.text+0x46e): undefined reference to `hid_parse_report'
>
> When CONFIG_ACPI or CONFIG_ACPI_WMI is not set:
>
> ld: drivers/platform/x86/tuxedo/nb04/wmi_ab.o: in function `tuxedo_nb04_wmi_tux_init':
> wmi_ab.c:(.init.text+0x20): undefined reference to `__wmi_driver_register'
> ld: drivers/platform/x86/tuxedo/nb04/wmi_ab.o: in function `tuxedo_nb04_wmi_tux_exit':
> wmi_ab.c:(.exit.text+0x9): undefined reference to `wmi_driver_unregister'
> ld: drivers/platform/x86/tuxedo/nb04/wmi_util.o: in function `__wmi_method_buffer_out.constprop.0':
> wmi_util.c:(.text+0x3a): undefined reference to `wmidev_evaluate_method'
>
Hi,

i think this happens because CONFIG_TUXEDO_NB04_WMI_AB does not declare any dependencies at all.
I would prefer if the original author would send the necessary fix, otherwise i can do it too.

Thanks,
Armin Wolf


