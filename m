Return-Path: <linux-next+bounces-6541-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1472AABBA2
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 09:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4B6D18979F0
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 07:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53DB97261D;
	Tue,  6 May 2025 06:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="XFajvfSL"
X-Original-To: linux-next@vger.kernel.org
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C72226D1F;
	Tue,  6 May 2025 06:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746512798; cv=none; b=E+ZcjF/zjEfqg24rR9oGnzo8Dhagb9MG5KdtGc9Wl43iZYGCnz7NHGxW/ahwu7V961jFariHJa4sAl0lLDeZ227ZOSJF1VYV6wH2Agtr5XM/opsP0DUPFJDLf/Ejcjgo+pQ1EAv0a66/AbN7lZEcNK3/PsTLx4l1BrEtMI+mwi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746512798; c=relaxed/simple;
	bh=kyLA5XbzswnwsjBPBR5XEjCoNmGDNd0I0rJpF+YAPtY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BgwydRMFw2A8SQgI/exgpNP2nH9p09dXsaNb0eBLdpaDxICzxuwD/+eJ0x8uf5abo7OWRJDiM+hJJn7dbE0h3TmgwbrykmGM8EQmJqjzmMp3MzDuWrEjZBH7N5AGin3vln+hjIJwJzloYNKB7FPkO6R7NvFxr0Vm1wLGHg5gbnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=XFajvfSL; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=ljWV7MOG4dgEkfCN8Ib7oNS8P+erCQXlR5KjhLSmVzQ=;
	t=1746512796; x=1747722396; b=XFajvfSL6bJmjZ1hN1iOJBi5HXgPAePEOFy8nYrot/UreaA
	tOQpU/sLgD8E1DvBkubyTOryMUz9wQYUi+NdyaazhFDU0SWuv3oh3TbASm4x78HqxgFjhZ9YZPZRN
	lQ5UKZivXyJryxQLSjjLSwREy5k7kxSBvQZ/hyhKk/wiIrH9UIgQdJD3iNqoqyKdmgd6ofyRRLPDu
	lbiBrRk5lBQJeK6krUoh9hmZZSHbAXVZtyWjO+IGttuYH6JWEoAzJoYkCyLzEhrKkFl7co/+m9xFF
	ehyiqbn25CN+IqjpMA7ZzUnhYf25zhClr7CUOG3RrSRHPuRwhTj9D6kenC9kJqwQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uCBlA-00000005aSk-0Qpn;
	Tue, 06 May 2025 08:26:32 +0200
Message-ID: <f53576b21774ab6ba8294c5d1954f0528764f2fb.camel@sipsolutions.net>
Subject: Re: linux-next: manual merge of the iwlwifi-next tree with Linus'
 tree
From: Johannes Berg <johannes@sipsolutions.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Miriam Rachel Korenblit
	 <miriam.rachel.korenblit@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Date: Tue, 06 May 2025 08:26:31 +0200
In-Reply-To: <20250506114402.2f440664@canb.auug.org.au>
References: <20250506114402.2f440664@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

Hi Stephen,

> Today's linux-next merge of the iwlwifi-next tree got conflicts in:
>=20
>   drivers/net/wireless/intel/iwlwifi/cfg/sc.c
>   drivers/net/wireless/intel/iwlwifi/iwl-config.h
>   drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c
>   drivers/net/wireless/intel/iwlwifi/iwl-trans.c
>   drivers/net/wireless/intel/iwlwifi/iwl-trans.h
>   drivers/net/wireless/intel/iwlwifi/pcie/drv.c
>   drivers/net/wireless/intel/iwlwifi/tests/devinfo.c
>=20
> between various commits from Linus' tree and various commits from the
> iwlwifi-next tree.

Yeah, no surprise, there were some reverts in this area. The good thing
is that we also already fixed the bugs that necessitated the reverts
differently, so (eventually, need to check how much is in there now)
this will just be "take next".

> At least one of the commits in Linus' tree is duplicated in the
> iwlwifi-next tree.

Right, saw your other mail too, we'll see what happened and drop those.

Thanks!

johannes

