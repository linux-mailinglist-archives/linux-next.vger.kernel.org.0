Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B836FE595
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 20:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbfKOT1V (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Nov 2019 14:27:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57476 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726365AbfKOT1V (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Nov 2019 14:27:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573846040;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t5bwJ9Tc1a6zK9nwOUNz5ANnrBVZCbMu+cXsXVw3oDM=;
        b=dU0+mr97oylYvI5i1aeIHmZhKglG3AH9R21Xq3QItiMyHZWnI1L7VcHfbDgmY1yOwrqbkV
        V7BkyY7OLEGgtK6rY8a/Dr4YET++a45LBtejqY2UAbzA/VtvQ+g871LaRwdL2qzWtLNDer
        SNexZpvej50/pChOx6pYZMY629mAxR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-MJGi2mUPNc-Hu_d0if3aEA-1; Fri, 15 Nov 2019 14:27:17 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38A9118B5F6A;
        Fri, 15 Nov 2019 19:27:16 +0000 (UTC)
Received: from localhost (unknown [10.18.25.174])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EBF960490;
        Fri, 15 Nov 2019 19:27:15 +0000 (UTC)
Date:   Fri, 15 Nov 2019 14:27:14 -0500
From:   Mike Snitzer <snitzer@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alasdair Kergon <agk@redhat.com>
Subject: Re: linux-next: Tree for Nov 15 (drivers/md/dm-integrity)
Message-ID: <20191115192714.GA28629@redhat.com>
References: <20191115190525.77efdf6c@canb.auug.org.au>
 <f368f431-b741-d04f-440b-3d8c3c035537@infradead.org>
 <d3a96436-0d9c-a13f-7524-33b203910367@infradead.org>
MIME-Version: 1.0
In-Reply-To: <d3a96436-0d9c-a13f-7524-33b203910367@infradead.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: MJGi2mUPNc-Hu_d0if3aEA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 15 2019 at 11:19am -0500,
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 11/15/19 8:17 AM, Randy Dunlap wrote:
> > On 11/15/19 12:05 AM, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Changes since 20191114:
> >>
> >=20
> > on i386:
> >=20
> > ld: drivers/md/dm-integrity.o: in function `calculate_device_limits':
> > dm-integrity.c:(.text.unlikely+0x1e9): undefined reference to `__udivdi=
3'
> >=20
> >=20

Thanks, I'll get it fixed up.
=20
> BTW, dm-devel@redhat.com seems to be invalid or dead.
>=20
> so adding Alasdair and Mike.

Think this is likely occurring for non-subscribers.
I haven't looked into it though, will check with Alasdair and/or others
to see if they are aware of any backend changes.

Mike

