Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA821EEB3E
	for <lists+linux-next@lfdr.de>; Thu,  4 Jun 2020 21:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728752AbgFDTgg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Jun 2020 15:36:36 -0400
Received: from linux.microsoft.com ([13.77.154.182]:37402 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728420AbgFDTgg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2020 15:36:36 -0400
Received: from jorhand-sb2.corp.microsoft.com (unknown [76.104.235.235])
        by linux.microsoft.com (Postfix) with ESMTPSA id 4919820B7185;
        Thu,  4 Jun 2020 12:36:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4919820B7185
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1591299395;
        bh=Wj3IFzpGg4vQIux2KK5gfmytqMUrK5JDeB2oZyK7nZ0=;
        h=From:To:Cc:Subject:Date:From;
        b=ETG3c85b67XW691yPa3rhCXvFbCy28ekwVUI/3jsxQXpMF+RNf2bQlWPcPS7PflRy
         umsrgGkv6fO7SIpnQxXH+MFZLOmsh2WU6cIlJoq8XbRi7CsRcWGk6DsKBWGAlHI9rP
         xNU1On31vVlDKuYro63toACMcMZKqnP9a1S2mXWI=
From:   jorhand@linux.microsoft.com
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        Jordan Hand <jorhand@linux.microsoft.com>
Subject: [PATCH] software node: recursively unregister child swnodes
Date:   Thu,  4 Jun 2020 12:36:23 -0700
Message-Id: <20200604193623.16946-1-jorhand@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: Jordan Hand <jorhand@linux.microsoft.com>

If a child swnode is unregistered after it's parent, it can lead to
undefined behavior.

When a swnode is unregistered, recursively free it's children to avoid
this condition.

Signed-off-by: Jordan Hand <jorhand@linux.microsoft.com>
---
 drivers/base/swnode.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index e5eb27375416..e63093b1542b 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -619,6 +619,8 @@ static void software_node_release(struct kobject *kobj)
 		property_entries_free(swnode->node->properties);
 		kfree(swnode->node);
 	}
+
+	list_del(&kobj->entry);
 	ida_destroy(&swnode->child_ids);
 	kfree(swnode);
 }
@@ -712,11 +714,6 @@ EXPORT_SYMBOL_GPL(software_node_register_nodes);
  * @nodes: Zero terminated array of software nodes to be unregistered
  *
  * Unregister multiple software nodes at once.
- *
- * NOTE: Be careful using this call if the nodes had parent pointers set up in
- * them before registering.  If so, it is wiser to remove the nodes
- * individually, in the correct order (child before parent) instead of relying
- * on the sequential order of the list of nodes in the array.
  */
 void software_node_unregister_nodes(const struct software_node *nodes)
 {
@@ -839,10 +836,16 @@ EXPORT_SYMBOL_GPL(fwnode_create_software_node);
 void fwnode_remove_software_node(struct fwnode_handle *fwnode)
 {
 	struct swnode *swnode = to_swnode(fwnode);
+	struct swnode *child = NULL;
 
 	if (!swnode)
 		return;
 
+	while (!list_empty(&swnode->children)) {
+		child = list_first_entry_or_null(&swnode->children, struct swnode, entry);
+		fwnode_remove_software_node(&child->fwnode);
+	}
+
 	kobject_put(&swnode->kobj);
 }
 EXPORT_SYMBOL_GPL(fwnode_remove_software_node);
-- 
2.17.1

