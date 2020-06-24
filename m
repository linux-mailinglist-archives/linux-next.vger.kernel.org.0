Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7058D206D59
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 09:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388477AbgFXHP3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Jun 2020 03:15:29 -0400
Received: from smtp-fw-9102.amazon.com ([207.171.184.29]:27638 "EHLO
        smtp-fw-9102.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388004AbgFXHP3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Jun 2020 03:15:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1592982928; x=1624518928;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   mime-version;
  bh=rf5tC53QUdVSMll6QyVv7dwGKxrszt6zwleP4iCPzMc=;
  b=Hi2wj/sQYI/7zZpegIHrTl9vMLpL47r7L/AeceafP4b40IB4Frg+p+wZ
   POpwaPfQZeXNkOCMz/1GwgbCwfKeUXEGXYgTmKfsrG4+tTBSSrOAM+S1g
   lkD5FKueIAkHnA4YpDmoVr++DrAEZXI+k5c+qOiKmhXTF5+28ef2Pwa1B
   o=;
IronPort-SDR: Rmdi+JmAeXGgHoSnGcrPe4J2jcUk1TEcNatrw97dB22eksZkCAHdZJNjraI58vevKDwPm7+0H4
 Ulk+9b9olgGg==
X-IronPort-AV: E=Sophos;i="5.75,274,1589241600"; 
   d="scan'208";a="54722623"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP; 24 Jun 2020 07:15:26 +0000
Received: from EX13MTAUEA002.ant.amazon.com (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
        by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS id 04475A1863;
        Wed, 24 Jun 2020 07:15:24 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 24 Jun 2020 07:15:24 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.162.248) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 24 Jun 2020 07:15:20 +0000
From:   SeongJae Park <sjpark@amazon.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        SeongJae Park <sjpark@amazon.de>
Subject: Re: linux-next: Fixes tag needs some work in the scsi-fixes tree
Date:   Wed, 24 Jun 2020 09:14:47 +0200
Message-ID: <20200624071447.19529-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624170742.4e9e9c96@canb.auug.org.au> (raw)
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.162.248]
X-ClientProxiedBy: EX13D45UWA003.ant.amazon.com (10.43.160.92) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 24 Jun 2020 17:07:42 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> 
> [-- Attachment #1: Type: text/plain, Size: 385 bytes --]
> 
> Hi all,
> 
> In commit
> 
>   46da547e21d6 ("scsi: lpfc: Avoid another null dereference in lpfc_sli4_hba_unset()")
> 
> Fixes tag
> 
>   Fixes: 1ffdd2c0440d ("scsi: lpfc: resolve static checker warning inlpfc_sli4_hba_unset")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'

Oops, sorry for the mistake.  I will send the fixed version in reply to this.


Thanks,
SeongJae Park

> 
> -- 
> Cheers,
> Stephen Rothwell
