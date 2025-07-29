Return-Path: <linux-next+bounces-7750-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A25BB14BF0
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 12:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3D6D1AA4C80
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 10:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB2D2749DA;
	Tue, 29 Jul 2025 10:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pbhPnC5U"
X-Original-To: linux-next@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B16C19F135;
	Tue, 29 Jul 2025 10:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753783705; cv=none; b=AtDE6mp7Awi22xDEAF3XRW4QqryWw5GZuSNs5yjiMqHHmdhWNhhh4WElxCfxyBCavxso6bHSppy/sxYfyGIjhi9ahJScLgsSwsa+f58LZgb+K6fZxmTgbxVFpG3CJAMxGJZEZDaROLK8bLBLGlc2YjG6htCB6yUbW51EcWPm90Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753783705; c=relaxed/simple;
	bh=5fNC/UPaGkwV99491pG0EBYdapDegM5tvoJS3Iagj/w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OsNlbZ8iFIh7DWxEL9mpVhh0CgPkReCegF+iliZRvM4DBkXkpicHULKtF84twZc8UG6X4PFH93wk2VL6e1/IHcFXwgNwWdnVCqiLJS4RwkkM82eUBa1Wm4pAEBB64YkUqOpb9xPX4o/Q7U77onmA3TwWr39jmDKWhHZKm940J0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pbhPnC5U; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50B46205AE;
	Tue, 29 Jul 2025 10:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753783701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UAkGJnZnTYflyNKOv3fSpVH6Z6Frd5MXsw6XzHEQa6A=;
	b=pbhPnC5USrbXG7BF+V7WvyN5eJZ2bULD1ZVdXMmN5dWYIACXw3JNLgTqiEr09bK+mtJR+Z
	TnxHNfWanm3F/Medalz0TKVM0njQY918RcmW9FbklvAc1U8FO0YEG70gilx2U9dedVOa8j
	HQxQ8ikHA2pWZzCTU8n9y2gZ6+YqcwXyX+vj5rxCNSLchvGc2SK2NlV5FiNMIy1HNWttck
	qOuJJz2XSw+2MDsCPLQIjA4dhg1o/ZAxNvvaTt6ioE+lHovl1KrkXT5Y+pWHEE3Dqjahb/
	XOSH2gwGFO1uZpyIAVvRcmUS8sN+Oum32HqaDyUzCs+ccKqzy/EO6C49TtY+4g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>,  Boris Brezillon
 <boris.brezillon@collabora.com>,  Gabor Juhos <j4g8y7@gmail.com>,  Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>,  Linux Next Mailing
 List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the spi tree with the nand tree
In-Reply-To: <20250729103816.5354a528@canb.auug.org.au> (Stephen Rothwell's
	message of "Tue, 29 Jul 2025 10:38:16 +1000")
References: <20250729103816.5354a528@canb.auug.org.au>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 29 Jul 2025 12:08:20 +0200
Message-ID: <87bjp3pawb.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhrihhsrdgsrhgviihilhhlohhnsegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepjhegghekhiejsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgp
 dhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

Hello,

On 29/07/2025 at 10:38:16 +10, Stephen Rothwell <sfr@canb.auug.org.au> wrot=
e:

> Hi all,
>
> Today's linux-next merge of the spi tree got a conflict in:
>
>   include/linux/mtd/nand-qpic-common.h
>
> between commit:
>
>   8e37aaf97153 ("mtd: nand: qpic-common: remove a bunch of unused defines=
")
>
> from the nand tree and commit:
>
>   0dc7e656ddd5 ("mtd: nand: qpic-common: add defines for ECC_MODE values")
>
> from the spi tree.

Indeed, I forgot about this change which conflicts. I'll drop the patch
from my tree, it is not urgent anyway. Gabor, please resend after a
rebase at -rc1, sorry for the extra work..

Thanks,
Miqu=C3=A8l

