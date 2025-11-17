Return-Path: <linux-next+bounces-9052-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 40025C64DD6
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 16:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CAA67342CB1
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 15:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1463E337BB2;
	Mon, 17 Nov 2025 15:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PLKBE83X"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A0C32D443
	for <linux-next@vger.kernel.org>; Mon, 17 Nov 2025 15:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763392936; cv=none; b=rnvQaykUZwnF3NMOd85eIQedFr9xGglwO6jBHOWIrJKHKaoGJCkDrTuGZOmJkHlDDWnASQbhLgcH4HSbtJEfT6ngLM1fdKoLclQwDN3l6bVnPNWdfyYW7LQTvurehKJ5ZrqjIxOfNDP/VdrPmxSZtPraDgFpMsoaagMt5Ce1B6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763392936; c=relaxed/simple;
	bh=17vtla297a9y+1Z6Y3w4eo3SL8PGOpth1pv2rT/+2Zo=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=rZXmkRkJHeGJC8hBsgOJMYA7cbW0w9LVs1bhfn7VNdH6yOyBQ3wUNEHHNwM6yBbsRvOZKCVzP4OHX3l4ixJF6W0/ACOfkSdj7y6kmawHqTtPxeHg7HldOXfjhcQa3jR8RAZvdzzwNuqOZ7VM7d6FxrJhpLm+/zCaT6VF6/LrfxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PLKBE83X; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763392933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BZ1ONyCE354z0Ub5HWDjuKQGFL0uiuBnMmxcCrDGL2Y=;
	b=PLKBE83XGz2wwhZ1ePWzPP6NYBg/bV9+TdO7hOqG2LbE9gGv6I/xiBfUoCKWU51ujIn534
	GDMyyAhO75eXBl5QGJ8G8xA7w/od3S1Q86fAE+tpR+7djEtmmdaADyFz/bwoABe+nzvwzZ
	x9fm0Dxd3QQGF5zQkcqnTmGW3QERxEE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-434-uHj_4_8FPvCeRtmybsGj5g-1; Mon,
 17 Nov 2025 10:22:10 -0500
X-MC-Unique: uHj_4_8FPvCeRtmybsGj5g-1
X-Mimecast-MFC-AGG-ID: uHj_4_8FPvCeRtmybsGj5g_1763392928
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 79037195608E;
	Mon, 17 Nov 2025 15:22:08 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.5])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 176B719560A7;
	Mon, 17 Nov 2025 15:22:04 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20251117145606.2155773-1-dhowells@redhat.com>
References: <20251117145606.2155773-1-dhowells@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
    Mark Brown <broonie@kernel.org>
Cc: dhowells@redhat.com, Herbert Xu <herbert@gondor.apana.org.au>,
    Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
    keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
    linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Pick up keys-pqc branch for linux-next?
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2157242.1763392923.1@warthog.procyon.org.uk>
Date: Mon, 17 Nov 2025 15:22:03 +0000
Message-ID: <2157243.1763392923@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Hi Stephen,

Can you pick up my keys-pqc branch for linux-next please?  It can be found at:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/
	keys-pqc

Note that it's based on Eric Bigger's libcrypto/lbcrypto-next branch which I
believe you already have in order to get SHA-3/SHAKE support.

Thanks,
David


