Return-Path: <linux-next+bounces-6083-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC07BA75400
	for <lists+linux-next@lfdr.de>; Sat, 29 Mar 2025 03:07:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60AB93A957C
	for <lists+linux-next@lfdr.de>; Sat, 29 Mar 2025 02:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34161BC58;
	Sat, 29 Mar 2025 02:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D3SDMQs5"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3CC1FB3
	for <linux-next@vger.kernel.org>; Sat, 29 Mar 2025 02:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743214020; cv=none; b=emQDjndrXtgVSH/EP8ga/e0VCVBjWARKC8U/sx1zFgtQZmk7c3fgcbhu0wbskMqjVc34lt57rJqXU/6WrRRQSrAokqIXlQOaeuxmLcRLSrSt31KoaTu36W8JC5AbffalJWfn0LwvgHC4TlvToBHp6dE/ZKYMjZef+HZp1tCOMlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743214020; c=relaxed/simple;
	bh=FGfh1w5NNAwOa7YGzQ31Zdi/MT5RLje1ttsCq9kxKUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0FC5edLGjuDmyW1a14QWokpUGu/7WCsL2ZQXKjLm3GbxD4tZy08aBt2cGcm4a1pwN2FHghm47qeUhbdt/ggckS2LzJswG3mi7IUB8Aa0rtU+EY6ZYmXUtF+vHJ2ZLbagjuq2rgUdTSKs8CoC5kaavgIUOoIaV/e07tuVmvjiIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D3SDMQs5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743214017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n+I0PCjfoO4Xb5NRpmwsp6+T9WL+XxdVxoqaSDpoe1c=;
	b=D3SDMQs5bCUwCc52OrzlXT7VMeLBjbYIJPKjH6mmq8UCpL0DJj/oLxjaycE7eK5xjL/ZNp
	U+qGnYMbe5OxhQWOadYU4q1DukPIgktth2BgqnfKphP+AFhpzBwjwVZmCIpgAHzzm/EG6a
	y60gVnQ6E9d1C6BmETJrBHFMRjRQZ44=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-172-pDcAzlcGOa2cPzjBH5KviQ-1; Fri,
 28 Mar 2025 22:06:53 -0400
X-MC-Unique: pDcAzlcGOa2cPzjBH5KviQ-1
X-Mimecast-MFC-AGG-ID: pDcAzlcGOa2cPzjBH5KviQ_1743214011
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 321441801A06;
	Sat, 29 Mar 2025 02:06:51 +0000 (UTC)
Received: from fedora (unknown [10.72.120.4])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B827B1956095;
	Sat, 29 Mar 2025 02:06:45 +0000 (UTC)
Date: Sat, 29 Mar 2025 10:06:39 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org
Subject: Re: next-20250327 - lockdep whine and USB issues at boot
Message-ID: <Z-dVr6cIyrOID0J0@fedora>
References: <8775.1743185453@turing-police>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8775.1743185453@turing-police>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On Fri, Mar 28, 2025 at 02:10:53PM -0400, Valdis Klētnieks wrote:
> Saw this during boot on a Dell Inspiron 5559 laptop.  
> 
> In addition, the external USB ports all gave up, rendering a USB mouse and a
> USB external drive totally dead in the water.  May or may not be related, I didn't
> dig too far into it.

It shouldn't be related to the warning.

> 
> [   40.842033] [    T953] io scheduler bfq registered
> 
> [   41.022391] [    T817] ======================================================
> [   41.103507] [    T817] WARNING: possible circular locking dependency detected
> [   41.184587] [    T817] 6.14.0-next-20250327 #110 Tainted: G          I     T  
> [   41.265700] [    T817] ------------------------------------------------------
> [   41.346832] [    T817] (udev-worker)/817 is trying to acquire lock:
> [   41.427952] [    T817] ffff93a2c80ae9f0 (&q->elevator_lock){+.+.}-{4:4}, at: elv_iosched_store+0xe1/0x260
> [   41.830112] [    T817] 
>                           but task is already holding lock:
> [   41.912022] [    T817] ffff93a2c80ae460 (&q->q_usage_counter(io)#10){++++}-{0:0}, at: blk_mq_freeze_queue_nomemsave+0x11/0x20

For this lockdep warning, feel free to try patch in the following link:

https://lore.kernel.org/linux-block/Z-dUCLvf06SfTOHy@fedora/

Thanks,
Ming


