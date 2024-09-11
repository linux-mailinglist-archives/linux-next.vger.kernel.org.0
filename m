Return-Path: <linux-next+bounces-3755-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09587974FE0
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 12:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4D291F20F35
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 10:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55545154BE4;
	Wed, 11 Sep 2024 10:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cLt5eucl"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F0717C7C4
	for <linux-next@vger.kernel.org>; Wed, 11 Sep 2024 10:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726051274; cv=none; b=XgfOOcowpDSlqzcJP+1yawYCF3r53lATr8Z4t5/bN42basZcUsPt6nxqmZL+vp7BueCGQqAITHYyzOdwyGKCkN2bpZiPxIM8sQ8kNI0ADVVyv6tCMVzFzPUETVwCxUjVOyp3BoA3b2SIBY40A1pWW0uAefSxDV92tJokujPVsz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726051274; c=relaxed/simple;
	bh=69CUuncPUr4x5RkMCSBIuqOHTfCMa+6MvkPUSEiBThE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOb4SDwEmiaHa98Z3DLiXYyNPs1pob/LMeqaUgiXXpM1KMv0XLH/ohHMW64zR4Ryt6wokkMthX7jfBD+BWjocChN6hMAeGPBiF4ZrCV4XMktB3PVIm/doVu1XW87AuG+xhCPxoCk9l6OLvvtgHTYIawjJ465a4FpwU/OrpzkIvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cLt5eucl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726051271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mj0Pmt4+l/yoZGolZSUlxlWO/3uwqqLnEmDHKUg/JNA=;
	b=cLt5eucl2TxUzF/uKtFSn2rjbfWsns3Exw1low6cMyMA38sxtJlsofbEU40wi5BfhxK7Mw
	nMJCtJ27ZgOVfyI4HXvOMMYEwckxraB1wcHfonQXMJqBp5dxuo4ysoNpINa1HXBGyNpVMQ
	LK6rLFhErMr2nUWvBNeyQC5AAxgtGO4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-N0c_emSPOui7KC1ZvIO0ng-1; Wed, 11 Sep 2024 06:41:10 -0400
X-MC-Unique: N0c_emSPOui7KC1ZvIO0ng-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a8a9094c96cso323013166b.1
        for <linux-next@vger.kernel.org>; Wed, 11 Sep 2024 03:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726051268; x=1726656068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mj0Pmt4+l/yoZGolZSUlxlWO/3uwqqLnEmDHKUg/JNA=;
        b=iC5vv0EfUa6+SYfDcJUprUWIqf6h5D3X+CGLd4JzAeIQKUk1xg4zngU5kqEwOqdzVI
         UPvpq11YyQVjO7yk0slLFKC2IUUh1k39c5FoD/WwfI06YqJ+hT5mxV5CH+zbICIiva5G
         xob2NehSssprZH+eZo+S+QILaMmbpnm9dMbiyO4N6qwJzDu36w+ZuiPXcb6QCZL3CaUO
         Pbm74s7SScSn4p/6r+ui1ZjScpx5UdvLkR8MjXacQ9eVrjNqNSAFeIzRcdoEYijRRvWH
         5NOQIwzwCA22KuZ2U4VxVeue2bJD5TyZXqXyfUfLuXREU4YeZioWROk45CoYNAsS2dWX
         hLOg==
X-Forwarded-Encrypted: i=1; AJvYcCU3pbcy9fnLm8aPgDmmkvtC0QaaO8RV51pRiPmIApcHFcq0EcKMo7hJa5nsojpIvOyMPgGJ7EpVInHZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/liasT8aJVanc8PFomi1oMQrohezB6L3fFVt+HN6mUiroeTjs
	MZYX1r9iAfrrSy8VT30oDYOJkVhqePz6EkUbFBWz4Mv8H1Ynwvyl8KuX9m7s0vhjNqUFz36VeYy
	3l03OJxinRauTAJ7lgi5nSVM3f740QB8vH+QEY8kc+PP4mlAa0b3Q3Fn7tNH+GAvnScM=
X-Received: by 2002:a17:907:608a:b0:a8a:af0c:dba9 with SMTP id a640c23a62f3a-a8ffab18a03mr338951266b.16.1726051268323;
        Wed, 11 Sep 2024 03:41:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjwow7xjZyNKq+znU2sWXTqiXCHb4WnKuVlTefeDqjperl96LUtyQ71qJkBZbFAcUmvdXTSQ==
X-Received: by 2002:a17:907:608a:b0:a8a:af0c:dba9 with SMTP id a640c23a62f3a-a8ffab18a03mr338948066b.16.1726051267557;
        Wed, 11 Sep 2024 03:41:07 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1ec:a3d1:80b4:b3a2:70bf:9d18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25ceaf86sm595722166b.155.2024.09.11.03.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 03:41:06 -0700 (PDT)
Date: Wed, 11 Sep 2024 06:41:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the vhost tree
Message-ID: <20240911064055-mutt-send-email-mst@kernel.org>
References: <20240911174708.5c52b33a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911174708.5c52b33a@canb.auug.org.au>

On Wed, Sep 11, 2024 at 05:47:08PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the mm-stable tree as a different commit
> (but the same patch):
> 
>   040b4f437e17 ("vduse: avoid using __GFP_NOFAIL")
> 
> This is commit
> 
>   955abe0a1b41 ("vduse: avoid using __GFP_NOFAIL")
> 
> in the mm-stable tree.
> 
> -- 
> Cheers,
> Stephen Rothwell

Dropped it now, thanks!


