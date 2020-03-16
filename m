Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84ACB18653F
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 07:52:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729684AbgCPGwK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 02:52:10 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:53978 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729319AbgCPGwK (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Mar 2020 02:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584341529;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wrXJ80WidgPz0D0bsI6MMgP3Bq85czaehdGVGfo95B0=;
        b=HMn9+qgZ75e+FEtF0bZlmRfliiUXQ5923HPJN0K+msqDPvbcVaiTYz36K9ypaXlKDIUFWP
        AcAxS7JFziCciJ0qlfi8B2W+WZtKUq0tvZDp8uKTpEi9P7nm7noYBCF3D8Eag6L8jryHiH
        VhP9Aimm663/hkZR74p7Ehh/nLY2blU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-BGkMqSSjOuKQWUXLxR1RvA-1; Mon, 16 Mar 2020 02:52:07 -0400
X-MC-Unique: BGkMqSSjOuKQWUXLxR1RvA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A110107ACCA;
        Mon, 16 Mar 2020 06:52:06 +0000 (UTC)
Received: from localhost (ovpn-12-129.pek2.redhat.com [10.72.12.129])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D17F5C1B2;
        Mon, 16 Mar 2020 06:52:05 +0000 (UTC)
Date:   Mon, 16 Mar 2020 14:51:59 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20200316065159.GA32517@MiWiFi-R3L-srv>
References: <20200313214214.4d2e2af6@canb.auug.org.au>
 <20200316045804.GC3486@MiWiFi-R3L-srv>
 <20200316171326.7ee3eebd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316171326.7ee3eebd@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 03/16/20 at 05:13pm, Stephen Rothwell wrote:
> Hi Baoquan,
> 
> On Mon, 16 Mar 2020 12:58:04 +0800 Baoquan He <bhe@redhat.com> wrote:
> >
> > I made a patch to fix these warnings, the reason has been told in the
> > log. Or just drop below patch. Both is fine to me.
> > 
> > mm-sparsec-move-subsection_map-related-functions-together.patch
> > 
> > From 273196eeb7bbc4af93bef18f594af91541e3ce8a Mon Sep 17 00:00:00 2001
> > From: Baoquan He <bhe@redhat.com>
> > Date: Sat, 14 Mar 2020 17:01:01 +0800
> > Subject: [PATCH] mm/sparse.c: move functions into CONFIG_MEMORY_HOTPLUG
> >  ifdeffery scope
> 
> I have applied this to linux-next today to see how it goes.

Thanks.

