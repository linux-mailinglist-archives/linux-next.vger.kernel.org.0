Return-Path: <linux-next+bounces-8447-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F32C8B95E32
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 14:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BAE02E4E50
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 12:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06BA323F75;
	Tue, 23 Sep 2025 12:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cYgxAMVU"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A263323F57
	for <linux-next@vger.kernel.org>; Tue, 23 Sep 2025 12:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758631985; cv=none; b=sN/+DxELUulb7fijZEu1dIRxejJoXQnu84qKOm95fQ7u2biqTcqRY+0nSniGYMLVG/1gVVTWFhtXsbfJxDyntCbOFo/GtPn0vj7sa9Q+n627QDEMXi0qc1PruV/0JrmPstnNKJz7bAc+Loypat8Dk2N5vAsVGYMyIBuB4Netsq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758631985; c=relaxed/simple;
	bh=nifdnnN/YFXrBSaLDuXvFzfIaHl2H+EQkr7zlSF4twM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WwYO8T9iEaK+O2XlRAp8eBwYTxLueUmLccoprbgklFsBofLWkSTzenVUd4ZANJ4+2Ciz+omVEw+x2nmOmyeYIFbkT67efkffvbdKQHjF5Y8iggEKWAx+HFjpdS6l99+560QbmFgkbpt3CeBqNtkpu/uNIM/Jz2+Gos7OTpUMk2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cYgxAMVU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758631983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vIUqLFXCJLnNqlkFKFk7iAZM2JcoBEoVoE3P17SZOiY=;
	b=cYgxAMVU19j5CIStGOGrxiTD1pLd0sn3OBrxOLCWxs/u6/2ioWnWr76LR6GFzeqN9dgjFT
	CFnag4WDssenoFKabjjxU0fW72e7YHPDgskwb1qxrhz/UZ7s9Dy7TaLge2+UQbLSH4gUj0
	LkR2UEegaQ8E/ulh9vuxnDvrt49cK/Y=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-9-btGlCJciM1ycMpHZbraiNQ-1; Tue,
 23 Sep 2025 08:53:01 -0400
X-MC-Unique: btGlCJciM1ycMpHZbraiNQ-1
X-Mimecast-MFC-AGG-ID: btGlCJciM1ycMpHZbraiNQ_1758631980
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 653701955DDD;
	Tue, 23 Sep 2025 12:53:00 +0000 (UTC)
Received: from [10.45.225.219] (unknown [10.45.225.219])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9A86C1955F21;
	Tue, 23 Sep 2025 12:52:58 +0000 (UTC)
Date: Tue, 23 Sep 2025 14:52:52 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mark Brown <broonie@kernel.org>
cc: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
    linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoffs in the device mapper tree
In-Reply-To: <aNKMSd1hhaeWvQ-A@finisterre.sirena.org.uk>
Message-ID: <95d76fa6-d6be-f34c-b5c6-b801e80adaf5@redhat.com>
References: <aNKMSd1hhaeWvQ-A@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17



On Tue, 23 Sep 2025, Mark Brown wrote:

> Commit
> 
>   9fddffbf6aa35 ("dm-integrity: allocate the recalculate buffer with kmalloc")
> 
> is missing a Signed-off-by from its author.
> 
> Commit
> 
>   9fddffbf6aa35 ("dm-integrity: allocate the recalculate buffer with kmalloc")
> 
> is missing a Signed-off-by from its committer.

OK

I fixed it.

Mikulas


