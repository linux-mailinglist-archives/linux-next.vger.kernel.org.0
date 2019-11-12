Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFEC4F98A9
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 19:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfKLSa7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 13:30:59 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60442 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726965AbfKLSa7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Nov 2019 13:30:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573583457;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4d5ChedR7dvswK6TDvTNuHGGoCXe2MiTAuMFOgs0PbM=;
        b=TPy+aMYGu3fYiux/AQpUQ/nIIoYFozuluiDp8Bb1NT77Bc2XjafWa++CD9lVBg9AptjO6L
        sCE/ZPjAlgWfJbhhzsaPXEjOMff/J7P7oVwn3j1I/1MI2BeT0hkpoxboywgh3j1DQTbRs1
        jhDl3NDFMuSVNE1QyopUygBVxPe/9oE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-54RSzGvbNyOdb39HWu8Bow-1; Tue, 12 Nov 2019 13:30:54 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41D65107AD58;
        Tue, 12 Nov 2019 18:30:53 +0000 (UTC)
Received: from emilne (unknown [10.18.25.205])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6892C61076;
        Tue, 12 Nov 2019 18:30:52 +0000 (UTC)
Message-ID: <b42a9108ef8c4a17c81e152f9ed0d981c4f1ccdf.camel@redhat.com>
Subject: Re: [PATCH 2/6] lpfc: fix: Coverity: lpfc_cmpl_els_rsp(): Null
 pointer dereferences
From:   "Ewan D. Milne" <emilne@redhat.com>
To:     James Smart <jsmart2021@gmail.com>, linux-scsi@vger.kernel.org
Cc:     Dick Kennedy <dick.kennedy@broadcom.com>,
        James Bottomley <James.Bottomley@SteelEye.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Date:   Tue, 12 Nov 2019 13:30:51 -0500
In-Reply-To: <20191111230401.12958-3-jsmart2021@gmail.com>
References: <20191111230401.12958-1-jsmart2021@gmail.com>
         <20191111230401.12958-3-jsmart2021@gmail.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 54RSzGvbNyOdb39HWu8Bow-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 2019-11-11 at 15:03 -0800, James Smart wrote:
> Coverity reported the following:
>=20
> *** CID 101747:  Null pointer dereferences  (FORWARD_NULL)
> /drivers/scsi/lpfc/lpfc_els.c: 4439 in lpfc_cmpl_els_rsp()
> 4433     =09=09=09kfree(mp);
> 4434     =09=09}
> 4435     =09=09mempool_free(mbox, phba->mbox_mem_pool);
> 4436     =09}
> 4437     out:
> 4438     =09if (ndlp && NLP_CHK_NODE_ACT(ndlp)) {
> vvv     CID 101747:  Null pointer dereferences  (FORWARD_NULL)
> vvv     Dereferencing null pointer "shost".
> 4439     =09=09spin_lock_irq(shost->host_lock);
> 4440     =09=09ndlp->nlp_flag &=3D ~(NLP_ACC_REGLOGIN | NLP_RM_DFLT_RPI);
> 4441     =09=09spin_unlock_irq(shost->host_lock);
> 4442
> 4443     =09=09/* If the node is not being used by another discovery thre=
ad,
> 4444     =09=09 * and we are sending a reject, we are done with it.
>=20
> Fix by adding a check for non-null shost in line 4438.
> The scenario when shost is set to null is when ndlp is null.
> As such, the ndlp check present was sufficient. But better safe
> than sorry so add the shost check.
>=20
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 101747 ("Null pointer dereferences")
> Fixes: 2e0fef85e098 ("[SCSI] lpfc: NPIV: split ports")
>=20
> Signed-off-by: Dick Kennedy <dick.kennedy@broadcom.com>
> Signed-off-by: James Smart <jsmart2021@gmail.com>
> CC: James Bottomley <James.Bottomley@SteelEye.com>
> CC: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
> CC: linux-next@vger.kernel.org
> ---
>  drivers/scsi/lpfc/lpfc_els.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/scsi/lpfc/lpfc_els.c b/drivers/scsi/lpfc/lpfc_els.c
> index 9a570c15b2a1..42a2bf38eaea 100644
> --- a/drivers/scsi/lpfc/lpfc_els.c
> +++ b/drivers/scsi/lpfc/lpfc_els.c
> @@ -4445,7 +4445,7 @@ lpfc_cmpl_els_rsp(struct lpfc_hba *phba, struct lpf=
c_iocbq *cmdiocb,
>  =09=09mempool_free(mbox, phba->mbox_mem_pool);
>  =09}
>  out:
> -=09if (ndlp && NLP_CHK_NODE_ACT(ndlp)) {
> +=09if (ndlp && NLP_CHK_NODE_ACT(ndlp) && shost) {
>  =09=09spin_lock_irq(shost->host_lock);
>  =09=09ndlp->nlp_flag &=3D ~(NLP_ACC_REGLOGIN | NLP_RM_DFLT_RPI);
>  =09=09spin_unlock_irq(shost->host_lock);

Reviewed-by: Ewan D. Milne <emilne@redhat.com>

