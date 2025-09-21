Return-Path: <linux-next+bounces-8404-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0D9B8E594
	for <lists+linux-next@lfdr.de>; Sun, 21 Sep 2025 22:44:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CDBB3B8750
	for <lists+linux-next@lfdr.de>; Sun, 21 Sep 2025 20:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4A828CF6D;
	Sun, 21 Sep 2025 20:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="m4wFbpIL"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439311F4E59;
	Sun, 21 Sep 2025 20:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758487493; cv=none; b=CP7ptH21II+EGBddRCkwIOzSWw0G9MRZlhlpbBDG4iBJD7vdHV4Ui1TOMKl4NADYTJqrR638RWcgUwbvAh5mwOQMHAhdP8G38BYGIA0rWPGaEBLzsbpT6WyqZmbDlItgJWOOFrXRRktVVsJPfRFksxkos4EoQb556dJwr+d7Md8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758487493; c=relaxed/simple;
	bh=9xMQ6NZUBtkSno5xqtdhLkhoLr6yQ14qZx2eqQyBnew=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rX+qIFASSaYwhe7LJeenhiRSXDQo1PgT2Ib6nCMbjaEKi6IuKQsdo4jOLS17IToWWtuRdchsxTNqMGaQ0H6SN7iTzdPa+Rypzdnn089aQ0dSkDDF/zkjTEB0uE1yLegPm2F6m3iDv3HJAro4NBjlrX2A7pmGQJoemzIPTA379S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=m4wFbpIL; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 20FEC40AF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1758487489; bh=haKXjPpJgA2Kzqrall/2z1gG8X8fBuitmPm4TabUhvs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=m4wFbpILQ3fEGIXylt+ykj/CdSjHQvmYcK7LQuiWibHsOrAz1sVMynQVSokxqWx67
	 eV4GGrDceUm1P/ctTGPWQVBsFqaHOZi8ZexKZCEwjflx4eC1LMEqH3smYxT9DASP7U
	 43THc58kKMIXk+uP+b9MB+1ZVvxZ+VShETK0rD+/zzqwg6DmIuLWBfPKL6V26M3Ur9
	 sbwO5eB53el9tfAMRFK6Fz9Kg4VDMaU+vWyjmXDqYJEw0U+Zbn2+L3UgUOfyaKNb+V
	 mlFl66byfjvb71+tj2yDYmC/Mmw13h6WQE5GD8fMuS+sjWbeW2cPCm3+dAcaGSRvSC
	 YqydoWXqmGXmg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 20FEC40AF9;
	Sun, 21 Sep 2025 20:44:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: linux-next: Tree for Sep 19 (make htmldocs problem)
In-Reply-To: <20250921223250.7af92f98@foz.lan>
References: <aM1xVa_SX3_QFU_q@sirena.org.uk>
 <883df949-0281-4a39-8745-bcdcce3a5594@infradead.org>
 <87ldm7c382.fsf@trenco.lwn.net>
 <e2112be7-ba68-43d1-92ba-98adfb869a95@infradead.org>
 <87cy7jbo7f.fsf@trenco.lwn.net> <20250921223250.7af92f98@foz.lan>
Date: Sun, 21 Sep 2025 14:44:48 -0600
Message-ID: <87qzvza62n.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> do you know what is this "alts" file? Is it a custom script or
> binary?

It's the alternatives mechanism that openSUSE uses.  I have no idea why
they felt the need to employ it for Sphinx, but they did, so we need to
work with that kind of configuration.  Meaning, really, I think we have
to just invoke sphinx-build directly rather than trying to control which
version of Python it may ultimately get.

jon

