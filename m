Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1620BEE667
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2019 18:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728216AbfKDRnC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Nov 2019 12:43:02 -0500
Received: from mail-pg1-f170.google.com ([209.85.215.170]:46906 "EHLO
        mail-pg1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728012AbfKDRnC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Nov 2019 12:43:02 -0500
Received: by mail-pg1-f170.google.com with SMTP id f19so11764778pgn.13
        for <linux-next@vger.kernel.org>; Mon, 04 Nov 2019 09:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=svU5wu9jxyDNTqh56sn1BrMM5j6L4vqGn/hsPL+Cnfg=;
        b=j3P2vzh7ioamd385S3KZgAdXOWez2ygoBx3aJ/sdXy7J1wDDMfD+I9fKjPkYcc9Hm9
         B7+lZeqEJ0O6/S1FcRIpkATQnNXkg0UUlTbqYKnMuYJk5kASgzvm5beKbrmtSjoe0HkH
         PGu9U2Nz0lQucxxHfVX/rik5EA6vhF+bWv4Ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=svU5wu9jxyDNTqh56sn1BrMM5j6L4vqGn/hsPL+Cnfg=;
        b=b8Y5RRjVmdv5pA5iHgnBoqAcmQdY4CIf+ULsFLQi2xOcUXeXZZmG8Huh4u97fNWgb0
         WwlTcn4EjDzm9/siJKjh7INoroq/v3zesRhG9oCnGo9ttnA20B35orUT7ho6Va/L3ED0
         enRSrqOesCrrIAaOO/3HtLweo+ioA2ML0lnywShxFSVa8fNRHIMvDhkmAEyrW2sAgNE5
         Z0DfhHpBxCb6MLnjPEJ3S66OyXnChBJ+9msiXoRAtXd1QPVwIOp1D773YKQ4nKvGbJ6h
         53PKvYfk9XZSdJall+pV8/oxDeC2IDH2fadUSgXAti2SmC7NWWSdlEbzrgvBK/V5g/9V
         +8lg==
X-Gm-Message-State: APjAAAWi9jyfnayqBGf7sNCkjoB8exiYvHO7X0KIlkvwrZOZyTLsOOOq
        Shux1xt78u+3BJ/eBm8TRoZ66w==
X-Google-Smtp-Source: APXvYqwyC5AwNuX70E68yB+KSgHiDxfKXJE5u39cOMUknXtx+80NJN80mn71WKvcdaOZERodyS39Yw==
X-Received: by 2002:a63:e84d:: with SMTP id a13mr29135434pgk.226.1572889381846;
        Mon, 04 Nov 2019 09:43:01 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 62sm16948604pfg.164.2019.11.04.09.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 09:43:01 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 4 Nov 2019 09:43:00 -0800
To:     James Smart <jsmart2021@gmail.com>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>,
        James Smart <james.smart@broadcom.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: lpfc_get_scsi_buf_s3(): Null pointer dereferences
Message-ID: <201911040943.283EF15C4A@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental automated report about issues detected by Coverity
from a scan of next-20191031 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by recent commits:

2a5b7d626ed2 ("scsi: lpfc: Limit tracking of tgt queue depth in fast path")

Coverity reported the following:

*** CID 1487391:  Null pointer dereferences  (FORWARD_NULL)
/drivers/scsi/lpfc/lpfc_scsi.c: 614 in lpfc_get_scsi_buf_s3()
608     		spin_unlock(&phba->scsi_buf_list_put_lock);
609     	}
610     	spin_unlock_irqrestore(&phba->scsi_buf_list_get_lock, iflag);
611
612     	if (lpfc_ndlp_check_qdepth(phba, ndlp)) {
613     		atomic_inc(&ndlp->cmd_pending);
vvv     CID 1487391:  Null pointer dereferences  (FORWARD_NULL)
vvv     Dereferencing null pointer "lpfc_cmd".
614     		lpfc_cmd->flags |= LPFC_SBUF_BUMP_QDEPTH;
615     	}
616     	return  lpfc_cmd;
617     }
618     /**
619      * lpfc_get_scsi_buf_s4 - Get a scsi buffer from io_buf_list of the HBA

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487391 ("Null pointer dereferences")
Fixes: 2a5b7d626ed2 ("scsi: lpfc: Limit tracking of tgt queue depth in fast path")


Thanks for your attention!

-- 
Coverity-bot
