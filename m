Return-Path: <linux-next+bounces-2943-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B8292EF2F
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 20:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 539FA282942
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 18:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B4416E88D;
	Thu, 11 Jul 2024 18:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aM+JIVu/"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2EC2BD04
	for <linux-next@vger.kernel.org>; Thu, 11 Jul 2024 18:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720723892; cv=none; b=IXUbj3SCCfZs9iNXz9xiVr8X/6MLZ2dX6IeKiTIcorWBQ3qFG01xLFN3Zzc7bgkIa2luexrDd9CgMy2R33KunyC2TRSd+iLK65YndYVRavnCynle4SB/oAlobmnkdRhoLceCeQ4/eV2KVB1XR3D3jPxjx4qFjKZ444otG41UiRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720723892; c=relaxed/simple;
	bh=GbVV3xtyV+YHsn6PR2MxtBSTwiFfW2plyd+t2FmGEs0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Zv0DWDllZVhHvA81Ug2m7dWHLTWkTrKXiSp0kp8xKhaHKrRljDR9xsYFzrts5bXcINakvQk07Q1TYKBco9q3dnc0y/9s27azQlkBWEUCKCIizjciTgegFwC9EmUz4DLViho+uP6p+fLNcQ/dKxufzC+i/epxY89J5X6CeX8CjFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aM+JIVu/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720723890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZuNkKNqv9pZLBGUFjsKQZGxQRVrivTuf741mq7BYdgk=;
	b=aM+JIVu/kQuPRe3XuWdEIMUNiB7sup3h6rpiFE65p44bQ0kfmBJ4FiWLFIG95Nrf6pWRIl
	lSo+Ck6lorTaSKZ8hAnStkoYrpv1lG6gHis2r9UoptRt3sCrHz73cd9f8Wclng+MEoeTPo
	3IV8+JR955rqghNZJUGyheClOoNyUTM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-612-wdVIOE8_NfOMjSY0DG08nA-1; Thu,
 11 Jul 2024 14:51:26 -0400
X-MC-Unique: wdVIOE8_NfOMjSY0DG08nA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 331B31955F56;
	Thu, 11 Jul 2024 18:51:22 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown [10.11.5.21])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C377A19560AA;
	Thu, 11 Jul 2024 18:51:21 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix, from userid 12668)
	id 1497330C1C19; Thu, 11 Jul 2024 18:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id 110B03FB48;
	Thu, 11 Jul 2024 20:51:17 +0200 (CEST)
Date: Thu, 11 Jul 2024 20:51:17 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <snitzer@kernel.org>
cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>, 
    Alasdair G Kergon <agk@redhat.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the device-mapper tree
In-Reply-To: <Zo_mnW5NcRBkWejT@kernel.org>
Message-ID: <ebfd8bf4-6260-f04-38f9-2ec234968171@redhat.com>
References: <20240711121729.0d71308e@canb.auug.org.au> <947e6d6b-f798-4f04-b6d7-d18ad550db66@kernel.dk> <Zo_mnW5NcRBkWejT@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40



On Thu, 11 Jul 2024, Mike Snitzer wrote:

> > Looks like the dm tree is re-applying patches yesterday rather
> > than pulling in the dependency?
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-6.11&id=e87621ac68fec9086d9f0af4fe96594dd8e07fbb
> > 
> > why?
> 
> Really good question.
> 
> Mikulas has been handling DM for the 6.11 development cycle.  But I've
> helped answer question and such along the way.  We actually had a
> meeting on Tuesday to discuss outstanding patches (in patchwork) and
> specifically discussed this very patch.  At the time I said I would
> get with you to make sure you were the one to pick up Damien's 5
> patches (which included what is now commit e87621ac68fe in block).  I
> specifically said that the entire series should go through block
> because even if DM picked up the one "dm: Refactor is_abnormal_io()"
> it'd cause problems because block would then depend on DM for a simple
> prep commit needed for later a patch in series.

I probably badly understood it, I added the patch to my notes and then I 
thought that I should apply it. Sorry for that.

Mikulas

> Anyway, I later saw you had already picked up Damien's series and had
> no need to reach out to you, I noted as much to a group chat at Red
> Hat (Mikulas included).  So not really sure what happened.
> 
> Sorry for the noise/trouble.
> 
> Mike
> 


