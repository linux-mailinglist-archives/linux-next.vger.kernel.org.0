Return-Path: <linux-next+bounces-8408-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D89B8E822
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 00:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B2F0189CBAD
	for <lists+linux-next@lfdr.de>; Sun, 21 Sep 2025 22:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA4C251793;
	Sun, 21 Sep 2025 22:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VH8BdhF/"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F2E23956E;
	Sun, 21 Sep 2025 22:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758492390; cv=none; b=A6s7/n+0soBqM6R2FdygHmaaTbfT0zukyUk2z+QwEuxyOnDxVUXceGxrfaXdga96g6X4oG24k+mw3wLWX6stJ6vlBw/v2PaWRX3m7+vYC+ke3oKW29EJUBPZ/AHIUE0Wqxpi0cRNiLOzpaU2xxLcTm7DMI2Arad7ZKsQEFqhzW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758492390; c=relaxed/simple;
	bh=eDVVBaPMnMvvHHCZRjDcXVB7COpfPss+neywu6lzSqo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cbtMe8pLu8XqH0wV6ua3ODbtPoOLeOnxjzCLTGza8k1XjeJYK1tv808SdoLOxAjocNI6xbUlg0em95jKy6Aq8+kVpMbaN37VwPFmj93c1LkAGsm8hR3KfYas418B2CNNCi6yZPPm4vPpZQgw8P+27KYGs8gcRrcJsGAX5IgSR/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VH8BdhF/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C226C4CEE7;
	Sun, 21 Sep 2025 22:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758492388;
	bh=eDVVBaPMnMvvHHCZRjDcXVB7COpfPss+neywu6lzSqo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VH8BdhF/6TfC4e1K4b4cmzKAv/Amu7dlN144HoSjvVdJpDgBc5tqWsqAgUZ/WMNRn
	 JLCSoFybY0W4tHEMws+hApPt23LOm+1/1Vg5J4UTmfOv3qZtKQoW0t7lYgF0aa27Nx
	 vVMR0a99s2RPoK9YnbcJR4el25eFGjks8iMj7/v5Sh01+pTT9CvkVXXEowMDoQ2ChZ
	 uHpxVxvLYeONDl7q+HaUaI2Xyd5+n3RVOH4RcO7tn3LXkPVudUlZDLxK1kOgXv0Ir3
	 3LUBaWcjRVOrSFlxiQHOeDdZjGJuGadpXnmIdRnugvieoiTkY4xt0RCrvV+YD0Ov+I
	 lNwUNh+SfqkqA==
Date: Mon, 22 Sep 2025 00:06:24 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: linux-next: Tree for Sep 19 (make htmldocs problem)
Message-ID: <20250922000624.0a9c2395@foz.lan>
In-Reply-To: <87bjn3a2qy.fsf@trenco.lwn.net>
References: <aM1xVa_SX3_QFU_q@sirena.org.uk>
	<883df949-0281-4a39-8745-bcdcce3a5594@infradead.org>
	<87ldm7c382.fsf@trenco.lwn.net>
	<e2112be7-ba68-43d1-92ba-98adfb869a95@infradead.org>
	<87cy7jbo7f.fsf@trenco.lwn.net>
	<20250921223250.7af92f98@foz.lan>
	<87qzvza62n.fsf@trenco.lwn.net>
	<20250921234301.0110130d@foz.lan>
	<87bjn3a2qy.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sun, 21 Sep 2025 15:56:37 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> >> I have no idea why
> >> they felt the need to employ it for Sphinx, but they did, so we need to
> >> work with that kind of configuration.  Meaning, really, I think we have
> >> to just invoke sphinx-build directly rather than trying to control which
> >> version of Python it may ultimately get.  
> >
> > True, but if we ignore PYTHON3 env completely, this will break on
> > other setups where sphinx is installed with a different python version
> > (with includes OpenSUSE non-thumbleweed).  
> 
> How do those setups work prior to your changes?  We didn't have to do
> that dance before, right?  What makes it necessary now?

We didn't, but in recent past minimal python version was below 3.6.

I added this after a feedback during patch review that it should be 
using PYTHON3 env var to better support Leap and other distros with
native python version < 3.7 and would require a pyhton version override 
to build docs.

Thanks,
Mauro

