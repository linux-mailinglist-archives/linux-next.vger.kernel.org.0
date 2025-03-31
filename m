Return-Path: <linux-next+bounces-6104-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6858A7631B
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 11:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3826D3A69B4
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 09:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177981D88A4;
	Mon, 31 Mar 2025 09:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UPQzH+Ep"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBB91C5D5E
	for <linux-next@vger.kernel.org>; Mon, 31 Mar 2025 09:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743412882; cv=none; b=Pp5FGL5pZM1dGsacbuWwxVOphg0xglQuzlmxsTWHbGz8m+ky9O9y5kMudwybSryCryzlkv/NS+GswNlGHDGw8guOdcVtt2PJC8LT0in0o+hBc+owCzUa/JASr951zgkrsB0jAjBjOgTjlFW+fe9VCpjfPb3GBjGiXFtSlNSq0Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743412882; c=relaxed/simple;
	bh=A/q95Mszo7oI+7BMFg+K7gqrw3B5Kfb6DstaYhYmUfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tG/gz129McFq6hZ8jDAaEQuy5+QuKP7Lx2Ee4Ipdh53e9fkTTyCuvimbvFa78z0kZKK0Il6r/PH8AAwUePyp2VHtkN8kE+COcN+vVpsc4UdmuTS46SRfLPouVbTslNNBUywPbKF6J08553X+5QVp+mAw5JAhLVTssCluYlXQbaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UPQzH+Ep; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743412879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BPld2TMVKNvxrI6q1VRGJO7d7XjErhaFH+sNM1huaWs=;
	b=UPQzH+Epv0mf9gj1j1Eh1YygIXhLw7+OlFtJNIfw9RL6kUth0JhDcD7VC5CWzd84fCkXS2
	oZmjNCIAOfBCirgZeQi5eyvNtbxXgmjlmb3wjKeY4aH3liXk0aL5S3OnCRr/bzJ3SSXbxZ
	ogS5SSVbyX7FTzZjb8MU3vKL3R3S6Xk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-519-YYmS3ViWNMejKwcS_KtyHw-1; Mon,
 31 Mar 2025 05:21:15 -0400
X-MC-Unique: YYmS3ViWNMejKwcS_KtyHw-1
X-Mimecast-MFC-AGG-ID: YYmS3ViWNMejKwcS_KtyHw_1743412874
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6DB971956087;
	Mon, 31 Mar 2025 09:21:13 +0000 (UTC)
Received: from fedora (unknown [10.72.120.27])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 60FA41955BC0;
	Mon, 31 Mar 2025 09:21:06 +0000 (UTC)
Date: Mon, 31 Mar 2025 17:21:01 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org
Subject: Re: next-20250327 - lockdep whine and USB issues at boot
Message-ID: <Z-peffTZ7lVo3m5n@fedora>
References: <8775.1743185453@turing-police>
 <Z-dVr6cIyrOID0J0@fedora>
 <7755.1743228130@turing-police>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7755.1743228130@turing-police>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On Sat, Mar 29, 2025 at 02:02:10AM -0400, Valdis Klētnieks wrote:
> On Sat, 29 Mar 2025 10:06:39 +0800, Ming Lei said:
> > On Fri, Mar 28, 2025 at 02:10:53PM -0400, Valdis Kl??tnieks wrote:
> > > Saw this during boot on a Dell Inspiron 5559 laptop.  
> > > 
> > > In addition, the external USB ports all gave up, rendering a USB mouse and a
> > > USB external drive totally dead in the water.  May or may not be related, I didn't
> > > dig too far into it.
> >
> > It shouldn't be related to the warning.
> 
> > For this lockdep warning, feel free to try patch in the following link:
> >
> > https://lore.kernel.org/linux-block/Z-dUCLvf06SfTOHy@fedora/
> 
> After applying that patch, USB *didn't* die during boot.  So apparently
> *something* changed.  

That is surprising, and maybe the USB die isn't 100% thing.

> 
> Also, the patch merely caused a *different* lockdep warning.
> Rather than  &q->q_usage_counter(io) and &q->elevator_lock, the
> new one is &q->elevator_lock versus pcpu_alloc_mutex...
> 
> Looks like it's a bit more convoluted than first looked?

That is another story wrt. freeze lock, fs_reclaim & percpu allocator
lock, looks one real risk, I will try to work one patch and see if
all can be addressed.



Thanks,
Ming


