Return-Path: <linux-next+bounces-3820-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF51D9779BD
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 09:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 829662868DA
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 07:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD92187355;
	Fri, 13 Sep 2024 07:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e6rTaqBG"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B25E77107
	for <linux-next@vger.kernel.org>; Fri, 13 Sep 2024 07:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726212877; cv=none; b=aWb5Doy0u2A/bCH2yNFCr14bDrGV//TFsBuCxZy1RjDyajZfAVecLoPtUUr4O8ttycYLXRJSl1PERSIRR+Jb+tqyTAc0mQ7QmoJCRg6mRXA7BEVAUUHzGgKZbQFmRCOKAXVIuyJWbiaMtl9DKsiosZHHRjvmPd1eFXr8AgER8Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726212877; c=relaxed/simple;
	bh=cdRWemqJpHIqLsS9xCEnNIkKZp+DNmQ97TOumGXLBHs=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=bkUT+wmyEwItUei3egZccN7H2mVZoCROZ1Drm8WIeq0+8bPnConmmkMK4E9Bib9CMOofxavVDkTp4qWuXD+tmcIn5Bbq+0OYrmIDI8PNDm+CdhShlzSbxDdddhjnltIeZ0F2gvHRN6OCi9ctXOQM14YZfFXRQqGnIUAUvX9zweg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e6rTaqBG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726212875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cdRWemqJpHIqLsS9xCEnNIkKZp+DNmQ97TOumGXLBHs=;
	b=e6rTaqBGn4STz814U3cZLwaKgjMtiZP8TW8kN6FmL6tY1HAPQtD190+P7N17LZRM3R8JrP
	0Xca20HGOXhyL+HPUpt1gjXwsFbsAD/N+s8mVJVi7MDtyxmEh3oginXfaelYvWW2e1Ysfh
	xCA4xjlQOvpddnqirhlzVERS/4vlmqw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-83-ymBn3kyFNNar0vBgZWSd3Q-1; Fri,
 13 Sep 2024 03:34:31 -0400
X-MC-Unique: ymBn3kyFNNar0vBgZWSd3Q-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AC0BB19560A3;
	Fri, 13 Sep 2024 07:34:30 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.67])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D0B8F19560A3;
	Fri, 13 Sep 2024 07:34:27 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <BL1PR21MB3088765BBE2F16AD813917AFE4642@BL1PR21MB3088.namprd21.prod.outlook.com>
References: <BL1PR21MB3088765BBE2F16AD813917AFE4642@BL1PR21MB3088.namprd21.prod.outlook.com> <20240913085945.40e7accf@canb.auug.org.au>
To: Steven French <Steven.French@microsoft.com>
Cc: dhowells@redhat.com, Stephen Rothwell <sfr@canb.auug.org.au>,
    Christian Brauner <brauner@kernel.org>,
    smfrench <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [EXTERNAL] linux-next: manual merge of the vfs-brauner tree with the cifs tree
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1262053.1726212866.1@warthog.procyon.org.uk>
Date: Fri, 13 Sep 2024 08:34:26 +0100
Message-ID: <1262054.1726212866@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Steven French <Steven.French@microsoft.com> wrote:

> Additional context: "cifs: Fix signature miscalculation" is fairly urgent
> since fixes a regression so plan to send that one upstream ASAP

The bug doesn't exist in Christian's vfs.netfs branch as the code was replaced
and ITER_XARRAY is no longer used there.

David


