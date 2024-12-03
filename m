Return-Path: <linux-next+bounces-4861-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F849E288A
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 18:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 685DD165AD4
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 17:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694E01F8916;
	Tue,  3 Dec 2024 17:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DxNlElGt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C557A1F76C6;
	Tue,  3 Dec 2024 17:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733245374; cv=none; b=saI6w+rQuCxtjfsFc92wM2Rvw+jqtdE9WW0TjU7GCPPOCZLGBHZckbJe1QM6dLd80zelO3j+pcIJ0GKMiIJPyk+O1sVPeysm+MqVeiH33K31ZlpQH2iZf9IhekYVvnIGQF4BfCZx9fXq2x+YW8of9WWDQJRlZ+t16ei7VUrh940=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733245374; c=relaxed/simple;
	bh=4onJmAuEn/gPvcPKpwAVf4XUSOY6vXaKxHKjF2JLfTc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Pflpv68EvjEBl7vIqheZCGEj71wcnqvsGwGnomcJawHSb032jqmPeYSSyeSFQf3P3u8XuunzR5W7ubtZVxwoZ8d/Y67rVziCzUhLCBo3BgzP5cyomGQWmpGtGi5xOSLUMFB90BgRkfuZGWdCCOlyh5MEx+lCmUfaMku6uL/qBQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DxNlElGt; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733245362;
	bh=sDBnWLdIyitSZ3qmu+9wRsBu3g24mjnplT3AmeMcxDs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=DxNlElGtTEYMF8IbOJckIJFwZDGH5xarFTu1LYh/wgKSD4MIpIvvPVpVFyj1/7cbP
	 ft7Smr/TBnSzkmIAXLDI8npUZHJIUnoWtcfOSOdarFsgKYW/ZdpAYh1TUL6hBvzbsg
	 jasqLuLt55n8hbdarB/7Ld1xcWpMHHMdX2HdJQghTZJ0llMVfT+g7md8eYBrEZnf6/
	 yTwQZN1+AggFuNKshavrvpVB+mOEx9MartE//IZ3q1GbVkPASoCi+rBqyjLj0HE5n+
	 ZHWnd0ZQ+g7XL3/HcItNNLTcQT3MKVOBzE/3BMM7xL+G6RgBCO7GvPmC9rnvHLj8Mg
	 xMJmsyK5e7fTA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y2n5Z1rvRz4x6Z;
	Wed,  4 Dec 2024 04:02:42 +1100 (AEDT)
Date: Wed, 04 Dec 2024 04:02:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>
CC: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Nov 28
User-Agent: K-9 Mail for Android
In-Reply-To: <ad4c0bbb-51df-4a5d-8c7a-e5dceb290bf9@sirena.org.uk>
References: <20241128133214.6a39d091@canb.auug.org.au> <ad4c0bbb-51df-4a5d-8c7a-e5dceb290bf9@sirena.org.uk>
Message-ID: <5D4F6778-BBD6-465D-A4C3-60F0EA0D2211@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 4 December 2024 12:35:40 am AEDT, Mark Brown <broonie@kernel=2Eorg> wrot=
e:
>On Thu, Nov 28, 2024 at 01:32:14PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>=20
>> News: There will be no linux-next releases tomorrow or next week=2E
>
>I didn't notice this until this morning=2E  I've got a build running for
>today, if there isn't a -next today there should hopefully be ones for
>the rest of the week=2E

Hi Mark,

Thanks, but don't worry too much as it's just the first week after the mer=
ge window has closed=2E
--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E

