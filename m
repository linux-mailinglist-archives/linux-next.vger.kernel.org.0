Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45FF7EE661
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2019 18:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729487AbfKDRmY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Nov 2019 12:42:24 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39563 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729535AbfKDRmY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Nov 2019 12:42:24 -0500
Received: by mail-pl1-f193.google.com with SMTP id o9so1212035plk.6
        for <linux-next@vger.kernel.org>; Mon, 04 Nov 2019 09:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=xGOrbFVGL9h8EWM/x0qaT8PD2xew18aDsPMqRHZQO/M=;
        b=HBIscy19L0cLXIspupYTeost09oKF627/4shvfKKV8AZHm0zWdteWvPu3UZEzp2YzY
         yM8ZduZEUwGqb9fRpeJplxG+52y+zguvD0SoqiSoPRIxowEqkZFc6ScsSmhlIC9jkTfC
         cOlWLOoGTnEhNfMZLCfiH7NH7LOVDd9VMhg/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=xGOrbFVGL9h8EWM/x0qaT8PD2xew18aDsPMqRHZQO/M=;
        b=NzXFIs6/2BGjc5KjutST9MpTW/0ztX0zS/uoCIiVJA7BUIbx8UgnqcdPd7qBhZcgN0
         BrdzohO4yJHzn0F4uwL/+mDMhW4UNmE35UZBHTSkv3I44Dym09VQJZ0AucJ61ec70z77
         d+eRxmQE2aMd56ZjoyngXvnTtIl4m16VyBmLHeJZCzi/2CQwAWcSp0KXFI5O6iCnx7Pz
         u0Pf1ps1lsgIO0rXhwLf+UN0uUorFVKktywCOQEvu9IqRIdG9u9zDDDBHbMXENrL0FC/
         osjg/jrHuBbWylAJwdhy/xLc3d6IPx61EjlrInhK41+gNbhqMRsWjQ73h796vJZK7jT/
         4cgg==
X-Gm-Message-State: APjAAAWdZqsuIzTEstG+8V6uukQtYYuShKDHQEHn4zWVuIIvpr4L4UGL
        4dA7d51SxvEr5Fc/kJHvEhqjYw==
X-Google-Smtp-Source: APXvYqy07eQikgLKw/E/NpV0ljw2PNpwX8xPDeDkcNDGZO+VGx4LzT6s1YuE4igWyfE2AGPc7Y9myw==
X-Received: by 2002:a17:902:b7cb:: with SMTP id v11mr339678plz.176.1572889343001;
        Mon, 04 Nov 2019 09:42:23 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x20sm15693575pfa.186.2019.11.04.09.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 09:42:22 -0800 (PST)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Mon, 4 Nov 2019 09:42:21 -0800
To:     Shahar S Matityahu <shahar.s.matityahu@intel.com>
Cc:     Luca Coelho <luciano.coelho@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: _iwl_dbgfs_fw_dbg_domain_write(): Insecure data handling
Message-ID: <201911040942.30D0EBA@keescook>
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

068893b7a28f ("iwlwifi: dbg_ini: support domain changing via debugfs")

Coverity reported the following:

*** CID 1487394:  Insecure data handling  (TAINTED_SCALAR)
/drivers/net/wireless/intel/iwlwifi/fw/debugfs.c: 355 in _iwl_dbgfs_fw_dbg_domain_write()
349     					    size_t size, char *buf)
350     {
351     	return scnprintf(buf, size, "0x%08x\n",
352     			 fwrt->trans->dbg.domains_bitmap);
353     }
354
vvv     CID 1487394:  Insecure data handling  (TAINTED_SCALAR)
vvv     Passing tainted variable "buf" to a tainted sink.
355     FWRT_DEBUGFS_READ_WRITE_FILE_OPS(fw_dbg_domain, 20);
356
357     void iwl_fwrt_dbgfs_register(struct iwl_fw_runtime *fwrt,
358     			    struct dentry *dbgfs_dir)
359     {
360     	INIT_DELAYED_WORK(&fwrt->timestamp.wk, iwl_fw_timestamp_marker_wk);
361     	FWRT_DEBUGFS_ADD_FILE(timestamp_marker, dbgfs_dir, 0200);
362     	FWRT_DEBUGFS_ADD_FILE(send_hcmd, dbgfs_dir, 0200);
363     	FWRT_DEBUGFS_ADD_FILE(fw_dbg_domain, dbgfs_dir, 0600);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1487394 ("Insecure data handling")
Fixes: 068893b7a28f ("iwlwifi: dbg_ini: support domain changing via debugfs")


Thanks for your attention!

-- 
Coverity-bot
