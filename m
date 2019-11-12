Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A95EF98A4
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 19:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbfKLSac (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 13:30:32 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29001 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726965AbfKLSab (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Nov 2019 13:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573583430;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3l55eh7+AZM0FjyRO1uZWlbag6Gc7dlqMMDqPnedYVw=;
        b=eTGiIoWJMlbp5i2Pp/32Fvlw7I1L0L8pr8UcB/m+jZYidbev++YHT1HpqAuKYtY5ReN2Ki
        sFrNnAv5RPIWImv99NeGWZN02MJjVv+qy2x65oFQXSBjiJw+r82+h5aUZkwFEtNYdxLIT2
        UTyOIvWCxql57Zh/FPPCq/qBFyg9bPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-dKsttPp6PwyheE-CPUhEuw-1; Tue, 12 Nov 2019 13:30:26 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 464CF107ACC8;
        Tue, 12 Nov 2019 18:30:25 +0000 (UTC)
Received: from emilne (unknown [10.18.25.205])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 61FCA101F6C5;
        Tue, 12 Nov 2019 18:30:24 +0000 (UTC)
Message-ID: <e8e868d7e2b4fe0894bb3badff6c63ecd80d6e28.camel@redhat.com>
Subject: Re: [PATCH 1/6] lpfc: fix: Coverity: lpfc_get_scsi_buf_s3(): Null
 pointer dereferences
From:   "Ewan D. Milne" <emilne@redhat.com>
To:     James Smart <jsmart2021@gmail.com>, linux-scsi@vger.kernel.org
Cc:     Dick Kennedy <dick.kennedy@broadcom.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Date:   Tue, 12 Nov 2019 13:30:23 -0500
In-Reply-To: <20191111230401.12958-2-jsmart2021@gmail.com>
References: <20191111230401.12958-1-jsmart2021@gmail.com>
         <20191111230401.12958-2-jsmart2021@gmail.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: dKsttPp6PwyheE-CPUhEuw-1
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
> *** CID 1487391:  Null pointer dereferences  (FORWARD_NULL)
> /drivers/scsi/lpfc/lpfc_scsi.c: 614 in lpfc_get_scsi_buf_s3()
> 608     =09=09spin_unlock(&phba->scsi_buf_list_put_lock);
> 609     =09}
> 610     =09spin_unlock_irqrestore(&phba->scsi_buf_list_get_lock, iflag);
> 611
> 612     =09if (lpfc_ndlp_check_qdepth(phba, ndlp)) {
> 613     =09=09atomic_inc(&ndlp->cmd_pending);
> vvv     CID 1487391:  Null pointer dereferences  (FORWARD_NULL)
> vvv     Dereferencing null pointer "lpfc_cmd".
> 614     =09=09lpfc_cmd->flags |=3D LPFC_SBUF_BUMP_QDEPTH;
> 615     =09}
> 616     =09return  lpfc_cmd;
> 617     }
> 618     /**
> 619      * lpfc_get_scsi_buf_s4 - Get a scsi buffer from io_buf_list of t=
he HBA
>=20
> Fix by checking lpfc_cmd to be non-NULL as part of line 612
>=20
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1487391 ("Null pointer dereferences")
> Fixes: 2a5b7d626ed2 ("scsi: lpfc: Limit tracking of tgt queue depth in fa=
st path")
>=20
> Signed-off-by: Dick Kennedy <dick.kennedy@broadcom.com>
> Signed-off-by: James Smart <jsmart2021@gmail.com>
> CC: "Martin K. Petersen" <martin.petersen@oracle.com>
> CC: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
> CC: linux-next@vger.kernel.org
> ---
>  drivers/scsi/lpfc/lpfc_scsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/scsi/lpfc/lpfc_scsi.c b/drivers/scsi/lpfc/lpfc_scsi.=
c
> index 959ef471d758..ba26df90a36a 100644
> --- a/drivers/scsi/lpfc/lpfc_scsi.c
> +++ b/drivers/scsi/lpfc/lpfc_scsi.c
> @@ -611,7 +611,7 @@ lpfc_get_scsi_buf_s3(struct lpfc_hba *phba, struct lp=
fc_nodelist *ndlp,
>  =09}
>  =09spin_unlock_irqrestore(&phba->scsi_buf_list_get_lock, iflag);
> =20
> -=09if (lpfc_ndlp_check_qdepth(phba, ndlp)) {
> +=09if (lpfc_ndlp_check_qdepth(phba, ndlp) && lpfc_cmd) {
>  =09=09atomic_inc(&ndlp->cmd_pending);
>  =09=09lpfc_cmd->flags |=3D LPFC_SBUF_BUMP_QDEPTH;
>  =09}

Reviewed-by: Ewan D. Milne <emilne@redhat.com>

