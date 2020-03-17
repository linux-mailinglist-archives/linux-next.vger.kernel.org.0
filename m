Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08177188EAC
	for <lists+linux-next@lfdr.de>; Tue, 17 Mar 2020 21:07:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgCQUHv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Mar 2020 16:07:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:49558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726491AbgCQUHv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Mar 2020 16:07:51 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AF6832073E;
        Tue, 17 Mar 2020 20:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584475670;
        bh=EATsUtB4pFYCF4WUpfN21F20UOVKNkVRNJ41pMvXbv8=;
        h=Date:From:To:cc:Subject:From;
        b=v6XZlwje7P7Y+3/BmN+V8mDPwD9pb9r3cx8CbmF3MDKIfN0c+ezFN86krItlg9Ka+
         lsyMlQY8QV28JmE3GST4E8juzLvPic/Zw2ZXftjdlaUDX7pfcm6dFAm8uhL0wivRjQ
         /ypKu2HzmEmxOKeyHAyOgA8WlaUNuYaUASFEZBPM=
Date:   Tue, 17 Mar 2020 21:07:47 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
cc:     linux-next@vger.kernel.org
Subject: Please (re)add trivial.git to linux-next
Message-ID: <nycvar.YFH.7.76.2003172106170.19500@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

I will try to revive trivial.git which I've been neglecting for quite a 
long time.

I've already pushed first part of the queue to kernel.org; could you 
please readd

	git://git.kernel.org/pub/scm/linux/kernel/git/jikos/trivial.git/

to linux-next again? (it was dropped some time ago due to inactivity).

Thanks,

-- 
Jiri Kosina
SUSE Labs

