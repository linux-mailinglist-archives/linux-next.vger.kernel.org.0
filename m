Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41B3010093D
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 17:32:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbfKRQcg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Nov 2019 11:32:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21433 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726314AbfKRQcg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Nov 2019 11:32:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574094755;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CON1qBDJa/YQvur/tHGGxfdyheVcZXsC9K2a2ZC3UXU=;
        b=h+gRTOFLbWZtC5Mw66nCkNBiEMnZ+plL67p9YWuUkaRM57zSb3n74Vqlp1iq6AHhJm6CUB
        GjmGZzQTTBjaAA2chZPdFaaW0g8Gh1i54FaRg27rnw0VIFWE9x+47j3SFlzLaz+U1tXQ69
        hLN4bp/BAh2SLiUXvvnI+LF1F1u9n70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-eAxzJkGxOsiYU3TcIlyDzw-1; Mon, 18 Nov 2019 11:32:33 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70C9E1902C48;
        Mon, 18 Nov 2019 16:32:32 +0000 (UTC)
Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 02830643E4;
        Mon, 18 Nov 2019 16:32:20 +0000 (UTC)
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
        (envelope-from <agk@redhat.com>)
        id 1iWjwo-0006wm-FL; Mon, 18 Nov 2019 16:32:18 +0000
Date:   Mon, 18 Nov 2019 16:32:18 +0000
From:   Alasdair G Kergon <agk@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alasdair Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com
Subject: Re: linux-next: Tree for Nov 15 (drivers/md/dm-integrity)
Message-ID: <20191118163218.GF1800@agk-dp.fab.redhat.com>
Mail-Followup-To: Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
        dm-devel@redhat.com
References: <20191115190525.77efdf6c@canb.auug.org.au> <f368f431-b741-d04f-440b-3d8c3c035537@infradead.org> <d3a96436-0d9c-a13f-7524-33b203910367@infradead.org>
MIME-Version: 1.0
In-Reply-To: <d3a96436-0d9c-a13f-7524-33b203910367@infradead.org>
Organization: Red Hat UK Ltd. Registered in England and Wales, number
        03798903. Registered Office: Peninsular House, 30-36 Monument
        Street, 4th Floor, London, England, EC3R 8NB.
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: eAxzJkGxOsiYU3TcIlyDzw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 15, 2019 at 08:19:53AM -0800, Randy Dunlap wrote:
> BTW, dm-devel@redhat.com seems to be invalid or dead.

Red Hat made a few changes to its mail configuration over the last
week.

If anyone reading this still has problems that might be related to
this, please send me the relevant details privately (e.g. full headers
of messages) and I'll try to engage the right people to help.

Alasdair

