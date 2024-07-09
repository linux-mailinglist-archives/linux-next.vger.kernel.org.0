Return-Path: <linux-next+bounces-2880-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 561E292B485
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 11:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C585280DC4
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 09:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20BA5155C8E;
	Tue,  9 Jul 2024 09:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DkEI8S1x"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397EE155730
	for <linux-next@vger.kernel.org>; Tue,  9 Jul 2024 09:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720518998; cv=none; b=rI7D16b0MIoZKGUfWp6aye+OcEvMjIORpfhTkcbS6xkcEFFLZ78r/q7plimQ5helJp4AHWIh/WQbxSv1eW7wJgh1AtHyGLcFPxutlWQD0cWt4cSkKBhF25m1b4lr4FMM1+mWlYxwwag30FiLWqvOkFZk0YV5BAKO3XnrFmHQmgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720518998; c=relaxed/simple;
	bh=Hc8mWwTsSqLiKssBhrXI+RSJ3hB0JGDAaECesXNRoKg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=tNrZ4NTrKE6qHJfzyIWqPYGCrBD1voKrzlW02c81ZY0yOqviPNCwqdAYA9OM377aWuGN/eMGK76gQPpbyCnvEgEdGrTqKpkp+TpYpj0q6BOl5BxVvrzq5mJCWnc2RFAg+wbPaLrMBse/JVIwpP4/k18GhloGBaTb0qWhUCt8yyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DkEI8S1x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720518994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LQm8VxvucuXhAHUDsU97RygdB8K+z8KC0PccTln5VKI=;
	b=DkEI8S1xNRPG+Ihwhy0dpuUMQp4QHTc7sbx/vkwsHZ+bWyqoyhceCFK8ySCETbEbtJTn7C
	Jeiqy5e515rvJjwOQ9nPknLAaN02y7wmoPdcQoqyd4i2VF3DWqZT1TMPZzRER0UREJcXyl
	IjZSCeY8Oq/38kwy0P660w+en1na1ZA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-me0haLOVNvacykUi3jFQTg-1; Tue,
 09 Jul 2024 05:56:30 -0400
X-MC-Unique: me0haLOVNvacykUi3jFQTg-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EE74F1955F45;
	Tue,  9 Jul 2024 09:56:28 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown [10.11.5.21])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BB8D219560AE;
	Tue,  9 Jul 2024 09:56:28 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix, from userid 12668)
	id 2DD3130C1C1C; Tue,  9 Jul 2024 09:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id 2ACDA41970;
	Tue,  9 Jul 2024 11:56:27 +0200 (CEST)
Date: Tue, 9 Jul 2024 11:56:27 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
cc: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the device-mapper
 tree
In-Reply-To: <20240709185733.4aac356a@canb.auug.org.au>
Message-ID: <49ab648e-3c89-d4d-f2f7-3c1e2aa2cab@redhat.com>
References: <20240709185733.4aac356a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12



On Tue, 9 Jul 2024, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the device-mapper tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/admin-guide/device-mapper/dm-crypt.rst:168: ERROR: Unexpected indentation.
> 
> Introduced by commit
> 
>   04a1020ad350 ("dm-crypt: limit the size of encryption requests")
> 
> -- 
> Cheers,
> Stephen Rothwell

How should it be fixed? Delete the '-' character? Or some other change?

Mikulas


