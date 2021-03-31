Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37CC93509EA
	for <lists+linux-next@lfdr.de>; Thu,  1 Apr 2021 00:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbhCaWDt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Mar 2021 18:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbhCaWDc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 Mar 2021 18:03:32 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54CDC061574
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 15:03:31 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id x126so15492554pfc.13
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 15:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=SMV832ttk4WjCenh3yESAWa51iUjuB88llZr9+O/pMc=;
        b=GtGaqk9nralj48qa3mmWipTjjuzNHvfUhZC0c9Ryu2BMYGbX37R9GjcdRMQThee/ZA
         0m46Vp6QvNWLD00QL57IHPll+n7T6iyNNy+TSvXdQPk/+v8hzUUzEw3yIiDJMHhcsOJK
         j98vvDQhh9SYfmmwz1b1h2H2+zXKnszgJf7P8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=SMV832ttk4WjCenh3yESAWa51iUjuB88llZr9+O/pMc=;
        b=q1AP0+axiodwX8LiqMKygxQMrYYqXMhhRmKcpDVleIoS6GjrUDF3g4VYxjfVYWoLv/
         Yx53F+jF+ljz/fcYZS24BcNLgXT8uQMqoziXj/7wgsGMXyqBMcVKqFI+M+3CIGtGpQ7t
         M7wUhBnDlI4E668DKMHxQbOR0h0fHdQbWmObpaDgrjG9GMCnt3/lcpPYouMQmXGQspqZ
         sYxjtKUwYM83gUiF9CiCeG/OlUJVHNllsDVzFi1SVH5I6hdzCpg1DIO4t41msYnWmbTO
         J8MsstP5Tq0pZg8b67FBIvk04qJgAdmQ5ItCQrhDjFzHqgcdwRI3FG0B4v4G/Nwr3qK1
         z/ww==
X-Gm-Message-State: AOAM531Fyikks+1Tyl4ZJsJylqA3USRIkFoUhG83Tq0/QOr4SOQ/nxCJ
        bOM21Jv0nE4Wk0ndRnywJm/Q1A==
X-Google-Smtp-Source: ABdhPJxKjpscVXvSBSc9LjK8RcKOhiNkGsEEh/gldp7s5jL6T/O5Zh3v2Qo8uWLZR4k127GoYOhuOQ==
X-Received: by 2002:a63:1e4b:: with SMTP id p11mr5134192pgm.301.1617228211306;
        Wed, 31 Mar 2021 15:03:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q19sm3252217pff.91.2021.03.31.15.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 15:03:30 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Wed, 31 Mar 2021 15:03:30 -0700
To:     Richard Guy Briggs <rgb@redhat.com>
Cc:     Pablo Neira Ayuso <pablo@netfilter.org>,
        Paul Moore <paul@paul-moore.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: nf_tables_commit(): USE_AFTER_FREE
Message-ID: <202103311502.EDF441BE1@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20210331 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  None
    bb4052e57b5b ("audit: log nftables configuration change events once per table")

Coverity reported the following:

*** CID 1503581:    (USE_AFTER_FREE)
/net/netfilter/nf_tables_api.c: 8257 in nf_tables_commit()
8251     							   NFT_MSG_DELFLOWTABLE);
8252     				nft_unregister_flowtable_net_hooks(net,
8253     						&nft_trans_flowtable(trans)->hook_list);
8254     			}
8255     			break;
8256     		}
vvv     CID 1503581:    (USE_AFTER_FREE)
vvv     Dereferencing freed pointer "trans".
8257     		nf_tables_commit_audit_collect(&adl, trans->ctx.table,
8258     					       trans->msg_type);
8259     	}
8260
8261     	nft_commit_notify(net, NETLINK_CB(skb).portid);
8262     	nf_tables_gen_notify(net, skb, NFT_MSG_NEWGEN);

Notes from a human:

This appears to be callable after potential calls to "nft_trans_destroy(trans);"



/net/netfilter/nf_tables_api.c: 8257 in nf_tables_commit()
8251     							   NFT_MSG_DELFLOWTABLE);
8252     				nft_unregister_flowtable_net_hooks(net,
8253     						&nft_trans_flowtable(trans)->hook_list);
8254     			}
8255     			break;
8256     		}
vvv     CID 1503581:    (USE_AFTER_FREE)
vvv     Dereferencing freed pointer "trans".
8257     		nf_tables_commit_audit_collect(&adl, trans->ctx.table,
8258     					       trans->msg_type);
8259     	}
8260
8261     	nft_commit_notify(net, NETLINK_CB(skb).portid);
8262     	nf_tables_gen_notify(net, skb, NFT_MSG_NEWGEN);
/net/netfilter/nf_tables_api.c: 8257 in nf_tables_commit()
8251     							   NFT_MSG_DELFLOWTABLE);
8252     				nft_unregister_flowtable_net_hooks(net,
8253     						&nft_trans_flowtable(trans)->hook_list);
8254     			}
8255     			break;
8256     		}
vvv     CID 1503581:    (USE_AFTER_FREE)
vvv     Dereferencing freed pointer "trans".
8257     		nf_tables_commit_audit_collect(&adl, trans->ctx.table,
8258     					       trans->msg_type);
8259     	}
8260
8261     	nft_commit_notify(net, NETLINK_CB(skb).portid);
8262     	nf_tables_gen_notify(net, skb, NFT_MSG_NEWGEN);
/net/netfilter/nf_tables_api.c: 8257 in nf_tables_commit()
8251     							   NFT_MSG_DELFLOWTABLE);
8252     				nft_unregister_flowtable_net_hooks(net,
8253     						&nft_trans_flowtable(trans)->hook_list);
8254     			}
8255     			break;
8256     		}
vvv     CID 1503581:    (USE_AFTER_FREE)
vvv     Dereferencing freed pointer "trans".
8257     		nf_tables_commit_audit_collect(&adl, trans->ctx.table,
8258     					       trans->msg_type);
8259     	}
8260
8261     	nft_commit_notify(net, NETLINK_CB(skb).portid);
8262     	nf_tables_gen_notify(net, skb, NFT_MSG_NEWGEN);
/net/netfilter/nf_tables_api.c: 8257 in nf_tables_commit()
8251     							   NFT_MSG_DELFLOWTABLE);
8252     				nft_unregister_flowtable_net_hooks(net,
8253     						&nft_trans_flowtable(trans)->hook_list);
8254     			}
8255     			break;
8256     		}
vvv     CID 1503581:    (USE_AFTER_FREE)
vvv     Dereferencing freed pointer "trans".
8257     		nf_tables_commit_audit_collect(&adl, trans->ctx.table,
8258     					       trans->msg_type);
8259     	}
8260
8261     	nft_commit_notify(net, NETLINK_CB(skb).portid);
8262     	nf_tables_gen_notify(net, skb, NFT_MSG_NEWGEN);
/net/netfilter/nf_tables_api.c: 8257 in nf_tables_commit()
8251     							   NFT_MSG_DELFLOWTABLE);
8252     				nft_unregister_flowtable_net_hooks(net,
8253     						&nft_trans_flowtable(trans)->hook_list);
8254     			}
8255     			break;
8256     		}
vvv     CID 1503581:    (USE_AFTER_FREE)
vvv     Dereferencing freed pointer "trans".
8257     		nf_tables_commit_audit_collect(&adl, trans->ctx.table,
8258     					       trans->msg_type);
8259     	}
8260
8261     	nft_commit_notify(net, NETLINK_CB(skb).portid);
8262     	nf_tables_gen_notify(net, skb, NFT_MSG_NEWGEN);
/net/netfilter/nf_tables_api.c: 8257 in nf_tables_commit()
8251     							   NFT_MSG_DELFLOWTABLE);
8252     				nft_unregister_flowtable_net_hooks(net,
8253     						&nft_trans_flowtable(trans)->hook_list);
8254     			}
8255     			break;
8256     		}
vvv     CID 1503581:    (USE_AFTER_FREE)
vvv     Dereferencing freed pointer "trans".
8257     		nf_tables_commit_audit_collect(&adl, trans->ctx.table,
8258     					       trans->msg_type);
8259     	}
8260
8261     	nft_commit_notify(net, NETLINK_CB(skb).portid);
8262     	nf_tables_gen_notify(net, skb, NFT_MSG_NEWGEN);
/net/netfilter/nf_tables_api.c: 8257 in nf_tables_commit()
8251     							   NFT_MSG_DELFLOWTABLE);
8252     				nft_unregister_flowtable_net_hooks(net,
8253     						&nft_trans_flowtable(trans)->hook_list);
8254     			}
8255     			break;
8256     		}
vvv     CID 1503581:    (USE_AFTER_FREE)
vvv     Dereferencing freed pointer "trans".
8257     		nf_tables_commit_audit_collect(&adl, trans->ctx.table,
8258     					       trans->msg_type);
8259     	}
8260
8261     	nft_commit_notify(net, NETLINK_CB(skb).portid);
8262     	nf_tables_gen_notify(net, skb, NFT_MSG_NEWGEN);
/net/netfilter/nf_tables_api.c: 8257 in nf_tables_commit()
8251     							   NFT_MSG_DELFLOWTABLE);
8252     				nft_unregister_flowtable_net_hooks(net,
8253     						&nft_trans_flowtable(trans)->hook_list);
8254     			}
8255     			break;
8256     		}
vvv     CID 1503581:    (USE_AFTER_FREE)
vvv     Dereferencing freed pointer "trans".
8257     		nf_tables_commit_audit_collect(&adl, trans->ctx.table,
8258     					       trans->msg_type);
8259     	}
8260
8261     	nft_commit_notify(net, NETLINK_CB(skb).portid);
8262     	nf_tables_gen_notify(net, skb, NFT_MSG_NEWGEN);
/net/netfilter/nf_tables_api.c: 8257 in nf_tables_commit()
8251     							   NFT_MSG_DELFLOWTABLE);
8252     				nft_unregister_flowtable_net_hooks(net,
8253     						&nft_trans_flowtable(trans)->hook_list);
8254     			}
8255     			break;
8256     		}
vvv     CID 1503581:    (USE_AFTER_FREE)
vvv     Dereferencing freed pointer "trans".
8257     		nf_tables_commit_audit_collect(&adl, trans->ctx.table,
8258     					       trans->msg_type);
8259     	}
8260
8261     	nft_commit_notify(net, NETLINK_CB(skb).portid);
8262     	nf_tables_gen_notify(net, skb, NFT_MSG_NEWGEN);
/net/netfilter/nf_tables_api.c: 8257 in nf_tables_commit()
8251     							   NFT_MSG_DELFLOWTABLE);
8252     				nft_unregister_flowtable_net_hooks(net,
8253     						&nft_trans_flowtable(trans)->hook_list);
8254     			}
8255     			break;
8256     		}
vvv     CID 1503581:    (USE_AFTER_FREE)
vvv     Dereferencing freed pointer "trans".
8257     		nf_tables_commit_audit_collect(&adl, trans->ctx.table,
8258     					       trans->msg_type);
8259     	}
8260
8261     	nft_commit_notify(net, NETLINK_CB(skb).portid);
8262     	nf_tables_gen_notify(net, skb, NFT_MSG_NEWGEN);
/net/netfilter/nf_tables_api.c: 8257 in nf_tables_commit()
8251     							   NFT_MSG_DELFLOWTABLE);
8252     				nft_unregister_flowtable_net_hooks(net,
8253     						&nft_trans_flowtable(trans)->hook_list);
8254     			}
8255     			break;
8256     		}
vvv     CID 1503581:    (USE_AFTER_FREE)
vvv     Dereferencing freed pointer "trans".
8257     		nf_tables_commit_audit_collect(&adl, trans->ctx.table,
8258     					       trans->msg_type);
8259     	}
8260
8261     	nft_commit_notify(net, NETLINK_CB(skb).portid);
8262     	nf_tables_gen_notify(net, skb, NFT_MSG_NEWGEN);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1503581 ("USE_AFTER_FREE")
Fixes: bb4052e57b5b ("audit: log nftables configuration change events once per table")

Thanks for your attention!

-- 
Coverity-bot
