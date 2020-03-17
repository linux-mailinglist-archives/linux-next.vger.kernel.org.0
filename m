Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B066D188F48
	for <lists+linux-next@lfdr.de>; Tue, 17 Mar 2020 21:49:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgCQUth (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Mar 2020 16:49:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:60168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726388AbgCQUth (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Mar 2020 16:49:37 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9048920714;
        Tue, 17 Mar 2020 20:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584478177;
        bh=mF9u163Pj290KPNHMJugePJrnOjmOHlMRtA1GvoOkZY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=HLRsxa2b+22wM4G7ZB3x4JOngoESZiqYhj58gek2htaE09JdABCt6RpbcaaTUZz6W
         px9+8MEoT54nGNvWcS/3tDrHXIES/zo3TfhFUdR3uINcmAQ181yiCNdK0IzCLmbZIM
         QZ3KXhyvGjEUat3Nw5EwOitZJZEp0BzbX5vCzs2Q=
Date:   Tue, 17 Mar 2020 21:49:34 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
cc:     linux-next@vger.kernel.org
Subject: Re: Please (re)add trivial.git to linux-next
In-Reply-To: <nycvar.YFH.7.76.2003172106170.19500@cbobk.fhfr.pm>
Message-ID: <nycvar.YFH.7.76.2003172149190.19500@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2003172106170.19500@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 17 Mar 2020, Jiri Kosina wrote:

> I will try to revive trivial.git which I've been neglecting for quite a 
> long time.
> 
> I've already pushed first part of the queue to kernel.org; could you 
> please readd
> 
> 	git://git.kernel.org/pub/scm/linux/kernel/git/jikos/trivial.git/

... more precisely 'for-next' branch of that tree.

Thanks,

-- 
Jiri Kosina
SUSE Labs

