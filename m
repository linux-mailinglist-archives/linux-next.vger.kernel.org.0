Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A30319DC13
	for <lists+linux-next@lfdr.de>; Fri,  3 Apr 2020 18:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404615AbgDCQvs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Apr 2020 12:51:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47154 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2404609AbgDCQvs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Apr 2020 12:51:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585932707;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=2SJcOix8Fae6FyLtzcXlO0OaUSu2FwzPh/mvZNztQFQ=;
        b=WqYlpUEwoC9b0ZS8p+uRLWlOoQzJIWCF7dJ9IrmUrlQPvGAl8Z7AS5jAA3nmAVCnjzzOJ/
        avM1A4CO0wD0E0p/Jgp4qSG0pi2blATevNay1ZZm3qBgvD8g9L4oqzPiYwkvqRsAUmsIO3
        W8XwrCHoSFsL8JMiqaw3Ybaq0lBgnuo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-Ndb9pVMBPAuljmrtVMmZdA-1; Fri, 03 Apr 2020 12:51:45 -0400
X-MC-Unique: Ndb9pVMBPAuljmrtVMmZdA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1E8113F8;
        Fri,  3 Apr 2020 16:51:43 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-28.ams2.redhat.com [10.36.113.28])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8583718A85;
        Fri,  3 Apr 2020 16:51:41 +0000 (UTC)
From:   =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     kvm list <kvm@vger.kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Cornelia Huck <cohuck@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>
Subject: [PATCH 4/8] vhost: Fix bad order in vhost_test_set_backend at enable
Date:   Fri,  3 Apr 2020 18:51:15 +0200
Message-Id: <20200403165119.5030-5-eperezma@redhat.com>
In-Reply-To: <20200403165119.5030-1-eperezma@redhat.com>
References: <20200403165119.5030-1-eperezma@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Fixes: ("7c48601a3d4d tools/virtio: Add --reset=random")
---
 drivers/vhost/test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vhost/test.c b/drivers/vhost/test.c
index 789c096e454b..6aed0cab8b17 100644
--- a/drivers/vhost/test.c
+++ b/drivers/vhost/test.c
@@ -293,8 +293,8 @@ static long vhost_test_set_backend(struct vhost_test *n, unsigned index, int fd)
 		backend = vhost_vq_get_backend(vq);
 		vhost_vq_set_backend(vq, NULL);
 	} else {
-		r = vhost_vq_init_access(vq);
 		vhost_vq_set_backend(vq, backend);
+		r = vhost_vq_init_access(vq);
 		if (r == 0)
 			r = vhost_poll_start(&vq->poll, vq->kick);
 	}
-- 
2.18.1

