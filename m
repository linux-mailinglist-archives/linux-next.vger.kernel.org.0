Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2331221E7EE
	for <lists+linux-next@lfdr.de>; Tue, 14 Jul 2020 08:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbgGNGRG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jul 2020 02:17:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46575 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725788AbgGNGRG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Jul 2020 02:17:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594707424;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5237IuvMgTeLcciR2WRdBusDhcq3/u6O0nS/R7VQZtk=;
        b=DG6SCwRhWSBe/Bt7cFTfl8mYiLyJeDGqpgc569GwwszZB15dUhTbP+ziZNrNsxYJWJmAbz
        1nkx2DDmMX9P3f8pIdUFL8nQmpXJdy1eOHpvayhQdIy0t/8bq8Ysk6jTAglkcmnI1Asz+e
        QTXHND5zZBKWApbqdMEKgmtLG9Ij+hQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-8l_nubbtMx6PjXy50fqnoA-1; Tue, 14 Jul 2020 02:16:59 -0400
X-MC-Unique: 8l_nubbtMx6PjXy50fqnoA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76D2F184C5E1;
        Tue, 14 Jul 2020 06:16:57 +0000 (UTC)
Received: from krava (unknown [10.40.193.14])
        by smtp.corp.redhat.com (Postfix) with SMTP id 69B0272E4D;
        Tue, 14 Jul 2020 06:16:55 +0000 (UTC)
Date:   Tue, 14 Jul 2020 08:16:54 +0200
From:   Jiri Olsa <jolsa@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Networking <netdev@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Olsa <jolsa@kernel.org>
Subject: Re: linux-next: build failure after merge of the bpf-next tree
Message-ID: <20200714061654.GE183694@krava>
References: <20200714122247.797cf01e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714122247.797cf01e@canb.auug.org.au>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jul 14, 2020 at 12:22:47PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the bpf-next tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> tmp/ccsqpVCY.s: Assembler messages:
> tmp/ccsqpVCY.s:78: Error: unrecognized symbol type ""
> tmp/ccsqpVCY.s:91: Error: unrecognized symbol type ""
> 
> I don't know what has caused this (I guess maybe the resolve_btfids
> branch).
> 
> I have used the bpf-next tree from next-20200713 for today.

ok, trying to reproduce

thanks,
jirka

