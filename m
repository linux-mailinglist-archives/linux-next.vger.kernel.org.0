Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27E35174AEC
	for <lists+linux-next@lfdr.de>; Sun,  1 Mar 2020 04:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbgCADrf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 29 Feb 2020 22:47:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:46046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727242AbgCADrf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 29 Feb 2020 22:47:35 -0500
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0426621927;
        Sun,  1 Mar 2020 03:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583034453;
        bh=uQZcquYVgjwy3HvQ7ACJJ8ewGzSXNl3BBGoLqbsAuXY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ABbrDZkdNkmC3ScSYzKDQpc+Fy2tAIAG1h3SDIuygBLqxbGRmjfrrdH1UuuPUXnY8
         JoFA6ci8ZIXSHzKj5Vg9VI4r6dUenwmVmx8JStsq1BNi1OvM04Z36+Ne4blxP2uvNR
         Upj0oVfhJIxzUTWklrD9wrcjybajfHH/0oa90Qs4=
Date:   Sat, 29 Feb 2020 19:47:32 -0800
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     Claudio Imbrenda <imbrenda@linux.ibm.com>,
        linux-next@vger.kernel.org, david@redhat.com, aarcange@redhat.com,
        linux-mm@kvack.org, frankja@linux.ibm.com, sfr@canb.auug.org.au,
        jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, Will Deacon <will@kernel.org>
Subject: Re: [RFC v1 2/2] mm/gup/writeback: add callbacks for inaccessible
 pages
Message-Id: <20200229194732.e8bf21bbdb4f9878fecfb3ed@linux-foundation.org>
In-Reply-To: <2e3bf1a2-b672-68e0-97b6-42f08133e077@de.ibm.com>
References: <20200228154322.329228-1-imbrenda@linux.ibm.com>
        <20200228154322.329228-4-imbrenda@linux.ibm.com>
        <2e3bf1a2-b672-68e0-97b6-42f08133e077@de.ibm.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 28 Feb 2020 17:08:19 +0100 Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> while patch 1 is a fixup for the FOLL_PIN work in your patch queue,
> I would really love to see this patch in 5.7. The exploitation code
> of kvm/s390 is in Linux next also scheduled for 5.7.

Sounds good.  My inbox eagerly awaits v2 ;)
