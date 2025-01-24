Return-Path: <linux-next+bounces-5323-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6743AA1B0B3
	for <lists+linux-next@lfdr.de>; Fri, 24 Jan 2025 08:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F6831887097
	for <lists+linux-next@lfdr.de>; Fri, 24 Jan 2025 07:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95C11DA63D;
	Fri, 24 Jan 2025 07:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C1XAWL4i"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FA31DA631
	for <linux-next@vger.kernel.org>; Fri, 24 Jan 2025 07:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737702608; cv=none; b=bx3gMngJZULYWzfZeYSLLMrF2O8nd0hNDwc8IQESHSRMpE1iZS92Taqgl78xm7BMkmN8bmlJ6eew97aMb9GgPMTJoF+bZIA+YfNmDY85PQgtAqg4E/526xPhT09ICPBt55NyJ073wsbQ6AiSjcfP8oXh/a5RT0nsXMdRIypFKH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737702608; c=relaxed/simple;
	bh=3hJ+R7VSToHDm5ESEEcub7n+vQqlzszReWJk3z7rwWc=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=sUAaZEeFKImZDJt5beMPGOC2JDinJv5FrtvL7DBfsZLouNg7L3esYI9lyQX61ccr6LFo/3N7vMtPeN6C482VTa9zUayEmECj4CAW1BOSR5IlyWMkTwCxjDEmS0QSjfIqVZIaKUg5hlXoUICFdxvLHB6Xmn/XPeYGvrSZLg5X6RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C1XAWL4i; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737702605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3hJ+R7VSToHDm5ESEEcub7n+vQqlzszReWJk3z7rwWc=;
	b=C1XAWL4iqB7JLvLYyBIvqmpz9mI87Emgt2QT+J1jCMwagJVZuo6ICYCSYsFj90hGrsV0UV
	O0GP6tqoDwAR1NIgx7VL3Cq+inKTUKoVroHUVTIIcTm5VmDDL/sXi4J13YTg9GBNoXeDvT
	LeRy+gP3eE4tDzqsl+NUjw298LrDZ1I=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-322-XbFvr2DmO_mGVrzFQNRz_Q-1; Fri,
 24 Jan 2025 02:10:01 -0500
X-MC-Unique: XbFvr2DmO_mGVrzFQNRz_Q-1
X-Mimecast-MFC-AGG-ID: XbFvr2DmO_mGVrzFQNRz_Q
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 59EB018EB220;
	Fri, 24 Jan 2025 07:09:50 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.5])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7015F19560B5;
	Fri, 24 Jan 2025 07:09:48 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20250124142722.7b8a4681@canb.auug.org.au>
References: <20250124142722.7b8a4681@canb.auug.org.au> <20250121091525.6ff05253@canb.auug.org.au> <2190350.1737644541@warthog.procyon.org.uk>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the afs tree
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2422892.1737702587.1@warthog.procyon.org.uk>
Date: Fri, 24 Jan 2025 07:09:47 +0000
Message-ID: <2422893.1737702587@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Do you want me to remove your tree from linux-next?

Yes, please.

Thanks,
David


